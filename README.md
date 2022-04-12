# Machine Learning Analysis of Schizophrenic EEG Records

Schizophrenia is chronic, can be debilitating, and is usually not diagnosed until after the patient has deteriorated to the point of their first psychotic break, which does irreparable damage to the brain. 

Though early diagnosis is critical, it has been notoriously difficult to find biomarkers for this disorder, so our first goal was to support the findings that schizophrenia involves abnormal relationships between different regions of the brain. 

We used EEG recordings to generate a dataset of engineered features including region correlation, extracted the most variable features as determined by PCA, and analyzed them using LASSO models with an average 71% accuracy. The models were able to support the suggestion that correlation between certain areas of the brain are significant factors for the presence of schizophrenia. 

## Source Data
- A full minute of EEG data at 128 Hz for 84 subjects, collected by 16 electrodes accross different areas of the brain 
- Data was sourced from Lomonosov Moscow State University: http://brain.bio.msu.ru/eeg_schizophrenia.htm
- Data was originally obtained and prepared by D.Sc., Prof. N.N. Gorbachevskaya (Leading Researcher at The Mental Health Research Center) and Ph.D. S.V. Borisov (Senior Researcher at Faculty of Biology M.V.Lomonosov Moscow State University).

## Files

RMD Files contain the code used for this project:
- DataPreProcessing: collected and compiled original files into EEGdataFull
- ExploratoryDataAnalysis: EDA performed on EEGdataFull 
- FeatureEngineering: used EEGdataFull to engineer EEGnew dataset
- PCA_KNN_Chitty: Principal Component Analysis performed on EEGnew, KNN base model
- Analysis: Univariate Analysis and LDA performed on EEGnew
- lasso: Final model creation and analysis

Data Files:
- EEGdataFull.zip: original data in its compiled form
- EEGnew.rds: dataset of 281 engineered features
- pVal_corr: P-values for correlation factors

