# Balancer_ML_K
This machine learning project uses linear regression method to predict the apparent power of a wind turbine using the following features
ambient_temp, hydraulic_oil_temp, phase_current_A, phase_current_B, phase_current_C, phase_voltage_A, phase_voltage_B
phase_voltage_C, turbine_status, wind_direction, wind_speed. The apparent power is computed using the provided active and reactive power from the wind turbine. 

Each of the wind turbine data sets were shared into three categories, TRANING DATASET, VALIDATON DATASET and TEST DATASET, at 60%, 20% and 20% respectively for each wind turbine dataset. A set of weights were trained and validated using the TRAINING and VALIDATION datasets, and using these trained and valided weights the future apparent power of a wind turbine(given the features above) can be made with as low as 0.05% error for some given test datasets
