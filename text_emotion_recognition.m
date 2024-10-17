% Text-Based Emotion Recognition System in MATLAB Using ISEAR Dataset

% Load the dataset
filename = 'ISEAR_dataset.csv'; % Change to your dataset file name
opts = detectImportOptions(filename); % Detect import options
opts.VariableNames{1} = 'ID';        % Rename first column
opts.VariableNames{2} = 'Emotion';   % Rename second column to Emotion
opts.VariableNames{3} = 'Content';   % Rename third column to Content
dataset = readtable(filename, opts); % Read the dataset

% Display the first few rows of the dataset
disp(head(dataset));

% Preprocess text data
documents = tokenizedDocument(dataset.Content); % Tokenize the content
documents = removeStopWords(documents);          % Remove stop words

% Create a bag-of-words model
bag = bagOfWords(documents);

% Create TF-IDF matrix
tfidfMatrix = tfidf(bag);

% Encode emotion labels as categorical
labels = dataset.Emotion;
labels = categorical(labels);

% Split the dataset into training (80%) and testing (20%) sets
cv = cvpartition(labels, 'HoldOut', 0.2);
idx = cv.test;

% Separate into training and testing data
dataTrain = tfidfMatrix(~idx, :);
labelTrain = labels(~idx);
dataTest = tfidfMatrix(idx, :);
labelTest = labels(idx);

% Train a multi-class Support Vector Machine (SVM) classifier using ECOC
SVMModel = fitcecoc(full(dataTrain), labelTrain);

% Test the classifier on the test set
predictions = predict(SVMModel, full(dataTest));

% Evaluate the model
confusionMat = confusionmat(labelTest, predictions);
disp('Confusion Matrix:');
disp(confusionMat);

accuracy = sum(predictions == labelTest) / length(labelTest);
fprintf('Accuracy: %.2f%%\n', accuracy * 100);

% Test with external text input
externalText = 'I am really frustrated with the service!';
newDoc = tokenizedDocument(externalText);
newDoc = removeStopWords(newDoc);
newTfidf = tfidf(bagOfWords(newDoc, bag)); % Use the existing bag to ensure consistent feature extraction
predictedEmotion = predict(SVMModel, full(newTfidf)); % Convert to full format
fprintf('Predicted Emotion for external text: %s\n', char(predictedEmotion));
