## Codebook - for Getting and Cleaning Data Project

### Dataset File
*run_analysis_tidy.csv*

### Variables
id  
Unique ID number: 1-180 unique identifier assignet to each row        

subject  
Subject number:  1-30 unique identifier assigned to each subject

activity  
Acitivity labels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
                  SITTING, STANDING, LAYING

time_body_acc_mean_x       
time_body_acc_mean_y              
time_body_acc_mean_z              
time_body_acc_std_x        
time_body_acc_std_y       
time_body_acc_std_z       
time_gravity_acc_mean_x    
time_gravity_acc_mean_y    
time_gravity_acc_mean_z   
time_gravity_acc_std_x     
time_gravity_acc_std_y     
time_gravity_acc_std_z     
time_body_accjerk_mean_x  
time_body_accjerk_mean_y   
time_body_accjerk_mean_z   
time_body_accjerk_std_x    
time_body_accjerk_std_y   
time_body_accjerk_std_z    
time_body_gyro_mean_x      
time_body_gyro_mean_y      
time_body_gyro_mean_z     
time_body_gyro_std_x       
time_body_gyro_std_y       
time_body_gyro_std_z       
time_body_gyrojerk_mean_x
time_body_gyrojerk_mean_y  
time_body_gyrojerk_mean_z  
time_body_gyrojerk_std_x   
time_body_gyrojerk_std_y  
time_body_gyrojerk_std_z   
time_body_accmag_mean      
time_body_accmag_std       
time_gravity_accmag_mean  
time_gravity_accmag_std    
time_body_accjerkmag_mean  
time_body_accjerkmag_std   
time_body_gyromag_mean    
time_body_gyromag_std      
time_body_gyrojerkmag_mean 
time_body_gyrojerkmag_std  
freq_body_acc_mean_x      
freq_body_acc_mean_y       
freq_body_acc_mean_z       
freq_body_acc_std_x        
freq_body_acc_std_y       
freq_body_acc_std_z        
freq_body_accjerk_mean_x  
freq_body_accjerk_mean_y  
freq_body_accjerk_mean_z  
freq_body_accjerk_std_x   
freq_body_accjerk_std_y    
freq_body_accjerk_std_z    
freq_body_gyro_mean_x     
freq_body_gyro_mean_y     
freq_body_gyro_mean_z      
freq_body_gyro_std_x       
freq_body_gyro_std_y      
freq_body_gyro_std_z     
freq_body_accmag_mean    
freq_body_accmag_std     
freq_body_accjerkmag_mean 
freq_body_accjerkmag_std  
freq_body_gyromag_mean    
freq_body_gyromag_std     
freq_body_gyrojerkmag_mean


### Transformation
- The result dataset has 180 rows and 69 columns (including the id column).
- All values are means, aggregated over 30 subjects and 6 activities.
- The dataset was ordered by subject and activity. 
- The set of variables that were estimated from the signals are: 
        mean(): Mean value
        std(): Standard deviation
- Prefix 't' was transformed to 'time_'
- Prefix 'f' was transformed to 'freq_'
- all labels are lowercase

## General Information
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals time_acc-xyz and time_gyro_xyz. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time_body_acc_xyz and time_gravity_acc_xyz) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time_body_accjerk_xyz and time_body_gyrojerk_xyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time_body_accmag, time_gravity_accmag, time_body_accjerkmag, time_body_gyromag, time_body_gyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freq_body_acc_xyz, freq_body_accjerk_xyz, freq_body_gyro_xyz, freq_body_accjerkmag, freq_body_gyromag, freq_body_gyrojerkmag. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_xyz' is used to denote 3-axial signals in the X, Y and Z directions.
