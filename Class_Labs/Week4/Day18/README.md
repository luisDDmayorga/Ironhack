# Cezch Bank 🇨🇿
## Machine learning model to predict loan status

<p align="center"><img width="500" alt="Captura de pantalla 2021-11-10 a las 16 33 09" src="https://user-images.githubusercontent.com/90793442/141142842-32daa8b2-cd22-463b-9aad-de189ae9a73a.png"></p>

## Table of contents
1. [Bussiness Context](#busi)
2. [Data](#data)
3. [Tools Used and Procces followed](#tools)
- [EDA and data cleaning](#eda)
- [Check correlations for numerical columns](#corr)
- [Split data into categorical and numbers](#spl)
- [Modeling - candidate model 1 with Log Reg](#model)
- [Evaluating candidate model 1](#eval)
4. [Visualization](#vis)
5. [Key Take Aways](#kta)
  


<a name="busi"></a>
### Business Context
We are working for a Czech Bank. They've asked us to develop a Machine Learning model to predict risky customers so they can minimize losses.
Loans are risky but at the same time are also products that generate profits for the bank. This ML model should be able to group loans into goodloans and badloans in order to find out a balance between risk and profits.

<a name="data"></a>
### Data
<p align="center"><img width="360" alt="Captura de pantalla 2021-11-10 a las 17 26 22" src="https://user-images.githubusercontent.com/90793442/141152392-7d48f9e9-2ef8-4c0a-9503-f60673ccaffb.png"></p>

<a name="tools"></a>
### Tools Used and Procces followed
First of all we started visualizing the data in **MySQL**. With this tool we were able to analyze all the data we had, create new views and join tables.
Once we create a table with the relevant data from the database, we import the query into **python**, using ***pymsql*** and ***sqlalchemy***.
Using python, we followed these steps:
<a name="eda"></a>
1. **EDA and data cleaning**
   - Remove nulls
   - Cleaning categoricals
<a name="corr"></a>
2. **Check correlations for numerical columns**
<p align="center"> <img width="300" alt="Captura de pantalla 2021-11-10 a las 17 33 07" src="https://user-images.githubusercontent.com/90793442/141153652-01ff0e67-c10f-4033-a468-4f9e51ee0585.png"></p>
<p align="center"> Correlation Matrix</p>
<a name="spl"></a>

3. **Split data into categorical and numbers**

   - Grouping into goodloan and badloan, and getting dummies values - Column status in the Loan table categorizes 'A' and 'C' as loans which are completed and doing fine (timely payments) respectively and 'B' and 'D' as loans which are defaulted and accounts currently in debt respectively. We created two classes (labels) out of these four categories combining A & C and B & D as 'goodloan' (labeled as 0) and 'badloan' (labeled as 1)
  <p align="center"> <img width="468" alt="Captura de pantalla 2021-11-10 a las 17 43 24" src="https://user-images.githubusercontent.com/90793442/141155396-d0a86e61-94af-4524-b5e7-d61effd11836.png"></p>
 <p align="center"> <img width="801" alt="Captura de pantalla 2021-11-10 a las 17 50 12" src="https://user-images.githubusercontent.com/90793442/141156612-a7558913-452e-46cf-80fb-78d630323884.png"></p>
<a name="model"></a>

 4. **Modeling - candidate model 1 with Log Reg**

    - Concatenating df and fitting the model to our training dataset
    
<p align="center"> <img width="387" alt="Captura de pantalla 2021-11-10 a las 17 57 59" src="https://user-images.githubusercontent.com/90793442/141157992-4fb09557-c3f1-4976-a217-a935257e2aa1.png"></p>
<p align="center"> <img width="201" alt="Captura de pantalla 2021-11-10 a las 17 58 28" src="https://user-images.githubusercontent.com/90793442/141158056-66c1ec63-b8b7-4e36-94f5-8f091039eea1.png"></p>
<a name="eval"></a>

 5. **Evaluating candidate model 1**

<a name="vis"></a>
### Visualization

All the code and graphs we've done can be founded [here](ClassLabDay18.ipynb).
<a name="kta"></a>
### Key Take Aways

Our model can predict a loan being good or bad with an accuracy of 88%.
Here you can see the confusion matrix and the AUC, which is of about 67%.

<p align="center"> <img width="336" alt="Captura de pantalla 2021-11-10 a las 18 17 49" src="https://user-images.githubusercontent.com/90793442/141161236-7e05d522-c732-4f6d-9786-9714e281a09f.png"></p>
<p align="center"> <img width="376" alt="Captura de pantalla 2021-11-10 a las 18 18 06" src="https://user-images.githubusercontent.com/90793442/141161281-3c4e7660-0473-425a-af32-dd695137073e.png"></p>

## THANKS! 💰🇨🇿
