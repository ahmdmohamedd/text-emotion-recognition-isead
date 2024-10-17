# Text Emotion Recognition System

This repository contains a MATLAB implementation of a text-based emotion recognition system using the **ISEAR** dataset. The model leverages Support Vector Machine (SVM) techniques to classify emotions expressed in text and allows predictions from external text inputs.

## Table of Contents
- [Introduction](#introduction)
- [Dataset](#dataset)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Model Training](#model-training)
- [Testing with External Text](#testing-with-external-text)
- [Evaluation Metrics](#evaluation-metrics)
- [Contributing](#contributing)
- [License](#license)

## Introduction

In today’s digital age, understanding emotions expressed in text has become increasingly important for applications in sentiment analysis, customer feedback, and mental health monitoring. This project aims to develop an efficient system for recognizing emotions from text, utilizing a machine learning approach.

## Dataset

The system is built using the **ISEAR** (International Survey on Emotion Antecedents and Reactions) dataset. This dataset contains various textual entries labeled with different emotions. The dataset is known for its diversity and comprehensiveness in capturing emotional expressions.

## Requirements

To run this project, you need:
- MATLAB (R2018b or later recommended)
- Statistics and Machine Learning Toolbox
- Text Analytics Toolbox

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/ahmdmohamedd/text-emotion-recognition-isead.git
   ```
   
2. Navigate to the project directory:
   ```bash
   cd text-emotion-recognition-isead
   ```

3. Ensure that you have the required toolboxes installed in MATLAB.

## Usage

1. **Load the Dataset:**
   Update the filename variable in the script to point to your ISEAR dataset file. The script assumes the dataset is in CSV format.

2. **Run the Script:**
   Open the script `text_emotion_recognition.m` in MATLAB and run it. The script will:
   - Load and preprocess the data.
   - Train the SVM model.
   - Evaluate the model on the test set.
   - Predict emotions for external text inputs.

## Model Training

The model is trained using a multi-class Support Vector Machine (SVM) with an error-correcting output codes (ECOC) framework. The training data consists of text data represented in TF-IDF (Term Frequency-Inverse Document Frequency) format to capture the importance of words in context.

## Testing with External Text

The system allows users to input external text to predict the emotion associated with that text. Modify the `externalText` variable in the script to test different inputs.

## Evaluation Metrics

The model's performance is evaluated using:
- Confusion Matrix: Displays the classification results across different emotions.
- Accuracy: Percentage of correctly classified instances.

## Contributing

Contributions are welcome! If you have suggestions for improvements or features, feel free to submit a pull request or open an issue.
