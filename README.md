SCRIPT

The following describes the script and variables required to complete the project tasks outlined in the Data Cleaning course.  The required tasks are:

        1. Merges the training and the test sets to create one data set.
        2. Extracts only the measurements for mean and standard deviation for each measurement.
        3. Uses descriptive activity names to name the activities in the data set
        4. Appropriately labels the data set with descriptive variable names. 
        5. From the data set in step 4, creates a second, independent tidy data set 
           with the average of each variable for each activity and each subject.


The script for run_analysis.R does the following:

- loads necessary R Package libraries
- sets the working directory
- loads all column name and data files to objects with more descriptive data names while still maintaining a relationship to the original source data name
- cleans the variable names provided in features.txt and train.x (X_train.txt) and train.y (y_train.txt).  
        This fulfills the requirement for TASK 4.
- create subject.status variable and populate with "TEST" or "TRAIN" as appropriate.
- replace the numeric activity code with the descriptive value (i.e WALKING, STANDING< etc.). 
        This fulfills the requirement for TASK 3
- merge all relevant data to one data set (data).
        This fulfills the requiement for TASK 1
- extract mean and standard deviation by search of descriptive variable names.
        This fulfills the requiement for TASK 2
- create the summary data set of means for group and activity (data5)
        This fulfills the requiement for TASK 5
        


CODE BOOK

SOURCE DATA and RELATED OBJECT

Local object naming was meant to be consistent with source data with minor modifications.  
Interial data was loaded, but ultimately not used in analysis.

        activity.labels <- activity_labels.txt
        features <- features.txt

        test.subject <- subject_test.txt
        test.x <- X_test.txt
        test.y <- y_test.txt

        train.subject <- subject_train.txt
        train.x <- X_train.txt
        train.y <- y_train.txt

        body.acc.x.test <- body_acc_x_test.txt
        body.acc.y.test <- body_acc_y_test.txt
        body.acc.z.test <- body_acc_z_test.txt

        body.gyro.x.test <- body_gyro_x_test.txt
        body.gyro.y.test <- body_gyro_y_test.txt
        body.gyro.z.test <- body_gyro_z_test.txt

        total.acc.x.test <- total_acc_x_test.txt
        total.acc.y.test <- total_acc_y_test.txt
        total.acc.z.test <- total_acc_z_test.txt

        body.acc.x.train <- body_acc_x_train.txt
        body.acc.y.train <- body_acc_y_train.txt
        body.acc.z.train <- body_acc_z_train.txt

        body.gyro.x.train <- body_gyro_x_train.txt
        body.gyro.y.train <- body_gyro_y_train.txt
        body.gyro.z.train <- body_gyro_z_train.txt

        total.acc.x.train <- total_acc_x_train.txt
        total.acc.y.train <- total_acc_y_train.txt
        total.acc.z.train <- total_acc_z_train.txt


OTHER OBJECTS

        feature.column.names <- extract of features from features.txt
        test <- combination of all test data
        train <- combination of all train data
        data <- combination of test and train data
        data2 <- data filtered for subject, subject.status, activity and all variables related
                to mean or standard deviation.
        data5temp <- data2 grouped by subject and activity
        data5 <- mean calculation for mean and standard deviation columns in data2


VARIABLES

        subject <- renamed variable containing subject id code
        subject.status <- addition of TEST or TRAIN based on source file
        activity <- renamed variable containing descriptive data (i.e. WALKING, STANDING, etc.)
                based upon relationship to activity code from activity.labels.txt
                

TRANSFORMED VARIABLES

The original variable names contained in features.txt included several invalid characters and character which are not consistent with tidy data variable naming conventions.

The following transformations were made from the original data in feature.txt to create the names used in the final output.

        all characters changed to lower case
        removal of "()", replaced with ""
        removal of "-", replaced with"."
        removal of "(", replaced with "."
        removal of ")", replaced with ""
        removal of ",", replaced with "."
        
The before and after is outlined below:        

1       tBodyAcc-mean()-X                       tbodyacc.mean.x
2	tBodyAcc-mean()-Y	                tbodyacc.mean.y
3	tBodyAcc-mean()-Z	                tbodyacc.mean.z
4	tBodyAcc-std()-X	                tbodyacc.std.x
5	tBodyAcc-std()-Y	                tbodyacc.std.y
6	tBodyAcc-std()-Z	                tbodyacc.std.z
7	tBodyAcc-mad()-X	                tbodyacc.mad.x
8	tBodyAcc-mad()-Y	                tbodyacc.mad.y
9	tBodyAcc-mad()-Z	                tbodyacc.mad.z
10	tBodyAcc-max()-X	                tbodyacc.max.x
11	tBodyAcc-max()-Y	                tbodyacc.max.y
12	tBodyAcc-max()-Z	                tbodyacc.max.z
13	tBodyAcc-min()-X	                tbodyacc.min.x
14	tBodyAcc-min()-Y	                tbodyacc.min.y
15	tBodyAcc-min()-Z                        tbodyacc.min.z
16	tBodyAcc-sma()	                        tbodyacc.sma
17	tBodyAcc-energy()-X	                tbodyacc.energy.x
18	tBodyAcc-energy()-Y	                tbodyacc.energy.y
19	tBodyAcc-energy()-Z	                tbodyacc.energy.z
20	tBodyAcc-iqr()-X	                tbodyacc.iqr.x
21	tBodyAcc-iqr()-Y	                tbodyacc.iqr.y
22	tBodyAcc-iqr()-Z	                tbodyacc.iqr.z
23	tBodyAcc-entropy()-X	                tbodyacc.entropy.x
24	tBodyAcc-entropy()-Y	                tbodyacc.entropy.y
25	tBodyAcc-entropy()-Z	                tbodyacc.entropy.z
26	tBodyAcc-arCoeff()-X,1	                tbodyacc.arcoeff.x.1
27	tBodyAcc-arCoeff()-X,2	                tbodyacc.arcoeff.x.2
28	tBodyAcc-arCoeff()-X,3	                tbodyacc.arcoeff.x.3
29	tBodyAcc-arCoeff()-X,4	                tbodyacc.arcoeff.x.4
30	tBodyAcc-arCoeff()-Y,1	                tbodyacc.arcoeff.y.1
31	tBodyAcc-arCoeff()-Y,2	                tbodyacc.arcoeff.y.2
32	tBodyAcc-arCoeff()-Y,3	                tbodyacc.arcoeff.y.3
33	tBodyAcc-arCoeff()-Y,4	                tbodyacc.arcoeff.y.4
34	tBodyAcc-arCoeff()-Z,1	                tbodyacc.arcoeff.z.1
35	tBodyAcc-arCoeff()-Z,2	                tbodyacc.arcoeff.z.2
36	tBodyAcc-arCoeff()-Z,3	                tbodyacc.arcoeff.z.3
37	tBodyAcc-arCoeff()-Z,4	                tbodyacc.arcoeff.z.4
38	tBodyAcc-correlation()-X,Y	        tbodyacc.correlation.x.y
39	tBodyAcc-correlation()-X,Z	        tbodyacc.correlation.x.z
40	tBodyAcc-correlation()-Y,Z	        tbodyacc.correlation.y.z
41	tGravityAcc-mean()-X	                tgravityacc.mean.x
42	tGravityAcc-mean()-Y	                tgravityacc.mean.y
43	tGravityAcc-mean()-Z            	tgravityacc.mean.z
44	tGravityAcc-std()-X             	tgravityacc.std.x
45	tGravityAcc-std()-Y             	tgravityacc.std.y
46	tGravityAcc-std()-Z             	tgravityacc.std.z
47	tGravityAcc-mad()-X             	tgravityacc.mad.x
48	tGravityAcc-mad()-Y             	tgravityacc.mad.y
49	tGravityAcc-mad()-Z             	tgravityacc.mad.z
50	tGravityAcc-max()-X             	tgravityacc.max.x
51	tGravityAcc-max()-Y             	tgravityacc.max.y
52	tGravityAcc-max()-Z             	tgravityacc.max.z
53	tGravityAcc-min()-X             	tgravityacc.min.x
54	tGravityAcc-min()-Y             	tgravityacc.min.y
55	tGravityAcc-min()-Z             	tgravityacc.min.z
56	tGravityAcc-sma()               	tgravityacc.sma
57	tGravityAcc-energy()-X          	tgravityacc.energy.x
58	tGravityAcc-energy()-Y	                tgravityacc.energy.y
59	tGravityAcc-energy()-Z          	tgravityacc.energy.z
60	tGravityAcc-iqr()-X             	tgravityacc.iqr.x
61	tGravityAcc-iqr()-Y             	tgravityacc.iqr.y
62	tGravityAcc-iqr()-Z             	tgravityacc.iqr.z
63	tGravityAcc-entropy()-X	                tgravityacc.entropy.x
64	tGravityAcc-entropy()-Y	                tgravityacc.entropy.y
65	tGravityAcc-entropy()-Z	                tgravityacc.entropy.z
66	tGravityAcc-arCoeff()-X,1       	tgravityacc.arcoeff.x.1
67	tGravityAcc-arCoeff()-X,2       	tgravityacc.arcoeff.x.2
68	tGravityAcc-arCoeff()-X,3	        tgravityacc.arcoeff.x.3
69	tGravityAcc-arCoeff()-X,4       	tgravityacc.arcoeff.x.4
70	tGravityAcc-arCoeff()-Y,1       	tgravityacc.arcoeff.y.1
71	tGravityAcc-arCoeff()-Y,2       	tgravityacc.arcoeff.y.2
72	tGravityAcc-arCoeff()-Y,3       	tgravityacc.arcoeff.y.3
73	tGravityAcc-arCoeff()-Y,4       	tgravityacc.arcoeff.y.4
74	tGravityAcc-arCoeff()-Z,1       	tgravityacc.arcoeff.z.1
75	tGravityAcc-arCoeff()-Z,2       	tgravityacc.arcoeff.z.2
76	tGravityAcc-arCoeff()-Z,3       	tgravityacc.arcoeff.z.3
77	tGravityAcc-arCoeff()-Z,4       	tgravityacc.arcoeff.z.4
78	tGravityAcc-correlation()-X,Y   	tgravityacc.correlation.x.y
79	tGravityAcc-correlation()-X,Z   	tgravityacc.correlation.x.z
80	tGravityAcc-correlation()-Y,Z   	tgravityacc.correlation.y.z
81	tBodyAccJerk-mean()-X	                tbodyaccjerk.mean.x
82	tBodyAccJerk-mean()-Y	                tbodyaccjerk.mean.y
83	tBodyAccJerk-mean()-Z	                tbodyaccjerk.mean.z
84	tBodyAccJerk-std()-X	                tbodyaccjerk.std.x
85	tBodyAccJerk-std()-Y	                tbodyaccjerk.std.y
86	tBodyAccJerk-std()-Z	                tbodyaccjerk.std.z
87	tBodyAccJerk-mad()-X	                tbodyaccjerk.mad.x
88	tBodyAccJerk-mad()-Y	                tbodyaccjerk.mad.y
89	tBodyAccJerk-mad()-Z	                tbodyaccjerk.mad.z
90	tBodyAccJerk-max()-X	                tbodyaccjerk.max.x
91	tBodyAccJerk-max()-Y	                tbodyaccjerk.max.y
92	tBodyAccJerk-max()-Z	                tbodyaccjerk.max.z
93	tBodyAccJerk-min()-X	                tbodyaccjerk.min.x
94	tBodyAccJerk-min()-Y	                tbodyaccjerk.min.y
95	tBodyAccJerk-min()-Z	                tbodyaccjerk.min.z
96	tBodyAccJerk-sma()	                tbodyaccjerk.sma
97	tBodyAccJerk-energy()-X	                tbodyaccjerk.energy.x
98	tBodyAccJerk-energy()-Y	                tbodyaccjerk.energy.y
99	tBodyAccJerk-energy()-Z	                tbodyaccjerk.energy.z
100	tBodyAccJerk-iqr()-X	                tbodyaccjerk.iqr.x
101	tBodyAccJerk-iqr()-Y	                tbodyaccjerk.iqr.y
102	tBodyAccJerk-iqr()-Z	                tbodyaccjerk.iqr.z
103	tBodyAccJerk-entropy()-X	        tbodyaccjerk.entropy.x
104	tBodyAccJerk-entropy()-Y	        tbodyaccjerk.entropy.y
105	tBodyAccJerk-entropy()-Z	        tbodyaccjerk.entropy.z
106	tBodyAccJerk-arCoeff()-X,1	        tbodyaccjerk.arcoeff.x.1
107	tBodyAccJerk-arCoeff()-X,2	        tbodyaccjerk.arcoeff.x.2
108	tBodyAccJerk-arCoeff()-X,3	        tbodyaccjerk.arcoeff.x.3
109	tBodyAccJerk-arCoeff()-X,4	        tbodyaccjerk.arcoeff.x.4
110	tBodyAccJerk-arCoeff()-Y,1	        tbodyaccjerk.arcoeff.y.1
111	tBodyAccJerk-arCoeff()-Y,2	        tbodyaccjerk.arcoeff.y.2
112	tBodyAccJerk-arCoeff()-Y,3	        tbodyaccjerk.arcoeff.y.3
113	tBodyAccJerk-arCoeff()-Y,4	        tbodyaccjerk.arcoeff.y.4
114	tBodyAccJerk-arCoeff()-Z,1	        tbodyaccjerk.arcoeff.z.1
115	tBodyAccJerk-arCoeff()-Z,2	        tbodyaccjerk.arcoeff.z.2
116	tBodyAccJerk-arCoeff()-Z,3	        tbodyaccjerk.arcoeff.z.3
117	tBodyAccJerk-arCoeff()-Z,4	        tbodyaccjerk.arcoeff.z.4
118	tBodyAccJerk-correlation()-X,Y	        tbodyaccjerk.correlation.x.y
119	tBodyAccJerk-correlation()-X,Z	        tbodyaccjerk.correlation.x.z
120	tBodyAccJerk-correlation()-Y,Z	        tbodyaccjerk.correlation.y.z
121	tBodyGyro-mean()-X	                tbodygyro.mean.x
122	tBodyGyro-mean()-Y	                tbodygyro.mean.y
123	tBodyGyro-mean()-Z	                tbodygyro.mean.z
124	tBodyGyro-std()-X	                tbodygyro.std.x
125	tBodyGyro-std()-Y	                tbodygyro.std.y
126	tBodyGyro-std()-Z	                tbodygyro.std.z
127	tBodyGyro-mad()-X	                tbodygyro.mad.x
128	tBodyGyro-mad()-Y	                tbodygyro.mad.y
129	tBodyGyro-mad()-Z	                tbodygyro.mad.z
130	tBodyGyro-max()-X	                tbodygyro.max.x
131	tBodyGyro-max()-Y	                tbodygyro.max.y
132	tBodyGyro-max()-Z	                tbodygyro.max.z
133	tBodyGyro-min()-X	                tbodygyro.min.x
134	tBodyGyro-min()-Y	                tbodygyro.min.y
135	tBodyGyro-min()-Z	                tbodygyro.min.z
136	tBodyGyro-sma()	                        tbodygyro.sma
137	tBodyGyro-energy()-X	                tbodygyro.energy.x
138	tBodyGyro-energy()-Y	                tbodygyro.energy.y
139	tBodyGyro-energy()-Z	                tbodygyro.energy.z
140	tBodyGyro-iqr()-X	                tbodygyro.iqr.x
141	tBodyGyro-iqr()-Y	                tbodygyro.iqr.y
142	tBodyGyro-iqr()-Z	                tbodygyro.iqr.z
143	tBodyGyro-entropy()-X	                tbodygyro.entropy.x
144	tBodyGyro-entropy()-Y	                tbodygyro.entropy.y
145	tBodyGyro-entropy()-Z	                tbodygyro.entropy.z
146	tBodyGyro-arCoeff()-X,1	                tbodygyro.arcoeff.x.1
147	tBodyGyro-arCoeff()-X,2	                tbodygyro.arcoeff.x.2
148	tBodyGyro-arCoeff()-X,3	                tbodygyro.arcoeff.x.3
149	tBodyGyro-arCoeff()-X,4	                tbodygyro.arcoeff.x.4
150	tBodyGyro-arCoeff()-Y,1	                tbodygyro.arcoeff.y.1
151	tBodyGyro-arCoeff()-Y,2	                tbodygyro.arcoeff.y.2
152	tBodyGyro-arCoeff()-Y,3	                tbodygyro.arcoeff.y.3
153	tBodyGyro-arCoeff()-Y,4	                tbodygyro.arcoeff.y.4
154	tBodyGyro-arCoeff()-Z,1	                tbodygyro.arcoeff.z.1
155	tBodyGyro-arCoeff()-Z,2	                tbodygyro.arcoeff.z.2
156	tBodyGyro-arCoeff()-Z,3	                tbodygyro.arcoeff.z.3
157	tBodyGyro-arCoeff()-Z,4	                tbodygyro.arcoeff.z.4
158	tBodyGyro-correlation()-X,Y	        tbodygyro.correlation.x.y
159	tBodyGyro-correlation()-X,Z	        tbodygyro.correlation.x.z
160	tBodyGyro-correlation()-Y,Z	        tbodygyro.correlation.y.z
161	tBodyGyroJerk-mean()-X	                tbodygyrojerk.mean.x
162	tBodyGyroJerk-mean()-Y	                tbodygyrojerk.mean.y
163	tBodyGyroJerk-mean()-Z	                tbodygyrojerk.mean.z
164	tBodyGyroJerk-std()-X	                tbodygyrojerk.std.x
165	tBodyGyroJerk-std()-Y	                tbodygyrojerk.std.y
166	tBodyGyroJerk-std()-Z	                tbodygyrojerk.std.z
167	tBodyGyroJerk-mad()-X	                tbodygyrojerk.mad.x
168	tBodyGyroJerk-mad()-Y	                tbodygyrojerk.mad.y
169	tBodyGyroJerk-mad()-Z	                tbodygyrojerk.mad.z
170	tBodyGyroJerk-max()-X	                tbodygyrojerk.max.x
171	tBodyGyroJerk-max()-Y	                tbodygyrojerk.max.y
172	tBodyGyroJerk-max()-Z	                tbodygyrojerk.max.z
173	tBodyGyroJerk-min()-X	                tbodygyrojerk.min.x
174	tBodyGyroJerk-min()-Y           	tbodygyrojerk.min.y
175	tBodyGyroJerk-min()-Z	                tbodygyrojerk.min.z
176	tBodyGyroJerk-sma()	                tbodygyrojerk.sma
177	tBodyGyroJerk-energy()-X	        tbodygyrojerk.energy.x
178	tBodyGyroJerk-energy()-Y	        tbodygyrojerk.energy.y
179	tBodyGyroJerk-energy()-Z	        tbodygyrojerk.energy.z
180	tBodyGyroJerk-iqr()-X	                tbodygyrojerk.iqr.x
181	tBodyGyroJerk-iqr()-Y	                tbodygyrojerk.iqr.y
182	tBodyGyroJerk-iqr()-Z	                tbodygyrojerk.iqr.z
183	tBodyGyroJerk-entropy()-X	        tbodygyrojerk.entropy.x
184	tBodyGyroJerk-entropy()-Y	        tbodygyrojerk.entropy.y
185	tBodyGyroJerk-entropy()-Z	        tbodygyrojerk.entropy.z
186	tBodyGyroJerk-arCoeff()-X,1	        tbodygyrojerk.arcoeff.x.1
187	tBodyGyroJerk-arCoeff()-X,2	        tbodygyrojerk.arcoeff.x.2
188	tBodyGyroJerk-arCoeff()-X,3	        tbodygyrojerk.arcoeff.x.3
189	tBodyGyroJerk-arCoeff()-X,4	        tbodygyrojerk.arcoeff.x.4
190	tBodyGyroJerk-arCoeff()-Y,1	        tbodygyrojerk.arcoeff.y.1
191	tBodyGyroJerk-arCoeff()-Y,2	        tbodygyrojerk.arcoeff.y.2
192	tBodyGyroJerk-arCoeff()-Y,3	        tbodygyrojerk.arcoeff.y.3
193	tBodyGyroJerk-arCoeff()-Y,4	        tbodygyrojerk.arcoeff.y.4
194	tBodyGyroJerk-arCoeff()-Z,1	        tbodygyrojerk.arcoeff.z.1
195	tBodyGyroJerk-arCoeff()-Z,2	        tbodygyrojerk.arcoeff.z.2
196	tBodyGyroJerk-arCoeff()-Z,3	        tbodygyrojerk.arcoeff.z.3
197	tBodyGyroJerk-arCoeff()-Z,4	        tbodygyrojerk.arcoeff.z.4
198	tBodyGyroJerk-correlation()-X,Y	        tbodygyrojerk.correlation.x.y
199	tBodyGyroJerk-correlation()-X,Z	        tbodygyrojerk.correlation.x.z
200	tBodyGyroJerk-correlation()-Y,Z	        tbodygyrojerk.correlation.y.z
201	tBodyAccMag-mean()	                tbodyaccmag.mean
202	tBodyAccMag-std()	                tbodyaccmag.std
203	tBodyAccMag-mad()	                tbodyaccmag.mad
204	tBodyAccMag-max()	                tbodyaccmag.max
205	tBodyAccMag-min()	                tbodyaccmag.min
206	tBodyAccMag-sma()	                tbodyaccmag.sma
207	tBodyAccMag-energy()            	tbodyaccmag.energy
208	tBodyAccMag-iqr()               	tbodyaccmag.iqr
209	tBodyAccMag-entropy()	                tbodyaccmag.entropy
210	tBodyAccMag-arCoeff()1	                tbodyaccmag.arcoeff1
211	tBodyAccMag-arCoeff()2	                tbodyaccmag.arcoeff2
212	tBodyAccMag-arCoeff()3	                tbodyaccmag.arcoeff3
213	tBodyAccMag-arCoeff()4	                tbodyaccmag.arcoeff4
214	tGravityAccMag-mean()	                tgravityaccmag.mean
215	tGravityAccMag-std()	                tgravityaccmag.std
216	tGravityAccMag-mad()	                tgravityaccmag.mad
217	tGravityAccMag-max()	                tgravityaccmag.max
218	tGravityAccMag-min()	                tgravityaccmag.min
219	tGravityAccMag-sma()	                tgravityaccmag.sma
220	tGravityAccMag-energy()	                tgravityaccmag.energy
221	tGravityAccMag-iqr()	                tgravityaccmag.iqr
222	tGravityAccMag-entropy()	        tgravityaccmag.entropy
223	tGravityAccMag-arCoeff()1	        tgravityaccmag.arcoeff1
224	tGravityAccMag-arCoeff()2	        tgravityaccmag.arcoeff2
225	tGravityAccMag-arCoeff()3	        tgravityaccmag.arcoeff3
226	tGravityAccMag-arCoeff()4       	tgravityaccmag.arcoeff4
227	tBodyAccJerkMag-mean()	                tbodyaccjerkmag.mean
228	tBodyAccJerkMag-std()	                tbodyaccjerkmag.std
229	tBodyAccJerkMag-mad()	                tbodyaccjerkmag.mad
230	tBodyAccJerkMag-max()	                tbodyaccjerkmag.max
231	tBodyAccJerkMag-min()	                tbodyaccjerkmag.min
232	tBodyAccJerkMag-sma()	                tbodyaccjerkmag.sma
233	tBodyAccJerkMag-energy()        	tbodyaccjerkmag.energy
234	tBodyAccJerkMag-iqr()   	        tbodyaccjerkmag.iqr
235	tBodyAccJerkMag-entropy()       	tbodyaccjerkmag.entropy
236	tBodyAccJerkMag-arCoeff()1      	tbodyaccjerkmag.arcoeff1
237	tBodyAccJerkMag-arCoeff()2      	tbodyaccjerkmag.arcoeff2
238	tBodyAccJerkMag-arCoeff()3      	tbodyaccjerkmag.arcoeff3
239	tBodyAccJerkMag-arCoeff()4      	tbodyaccjerkmag.arcoeff4
240	tBodyGyroMag-mean()	                tbodygyromag.mean
241	tBodyGyroMag-std()	                tbodygyromag.std
242	tBodyGyroMag-mad()	                tbodygyromag.mad
243	tBodyGyroMag-max()	                tbodygyromag.max
244	tBodyGyroMag-min()	                tbodygyromag.min
245	tBodyGyroMag-sma()	                tbodygyromag.sma
246	tBodyGyroMag-energy()	                tbodygyromag.energy
247	tBodyGyroMag-iqr()	                tbodygyromag.iqr
248	tBodyGyroMag-entropy()	                tbodygyromag.entropy
249	tBodyGyroMag-arCoeff()1	                tbodygyromag.arcoeff1
250	tBodyGyroMag-arCoeff()2	                tbodygyromag.arcoeff2
251	tBodyGyroMag-arCoeff()3	                tbodygyromag.arcoeff3
252	tBodyGyroMag-arCoeff()4	                tbodygyromag.arcoeff4
253	tBodyGyroJerkMag-mean()	                tbodygyrojerkmag.mean
254	tBodyGyroJerkMag-std()	                tbodygyrojerkmag.std
255	tBodyGyroJerkMag-mad()	                tbodygyrojerkmag.mad
256	tBodyGyroJerkMag-max()	                tbodygyrojerkmag.max
257	tBodyGyroJerkMag-min()	                tbodygyrojerkmag.min
258	tBodyGyroJerkMag-sma()	                tbodygyrojerkmag.sma
259	tBodyGyroJerkMag-energy()	        tbodygyrojerkmag.energy
260	tBodyGyroJerkMag-iqr()	                tbodygyrojerkmag.iqr
261	tBodyGyroJerkMag-entropy()	        tbodygyrojerkmag.entropy
262	tBodyGyroJerkMag-arCoeff()1	        tbodygyrojerkmag.arcoeff1
263	tBodyGyroJerkMag-arCoeff()2	        tbodygyrojerkmag.arcoeff2
264	tBodyGyroJerkMag-arCoeff()3	        tbodygyrojerkmag.arcoeff3
265	tBodyGyroJerkMag-arCoeff()4	        tbodygyrojerkmag.arcoeff4
266	fBodyAcc-mean()-X	                fbodyacc.mean.x
267	fBodyAcc-mean()-Y	                fbodyacc.mean.y
268	fBodyAcc-mean()-Z	                fbodyacc.mean.z
269	fBodyAcc-std()-X	                fbodyacc.std.x
270	fBodyAcc-std()-Y	                fbodyacc.std.y
271	fBodyAcc-std()-Z	                fbodyacc.std.z
272	fBodyAcc-mad()-X	                fbodyacc.mad.x
273	fBodyAcc-mad()-Y	                fbodyacc.mad.y
274	fBodyAcc-mad()-Z	                fbodyacc.mad.z
275	fBodyAcc-max()-X	                fbodyacc.max.x
276	fBodyAcc-max()-Y	                fbodyacc.max.y
277	fBodyAcc-max()-Z	                fbodyacc.max.z
278	fBodyAcc-min()-X	                fbodyacc.min.x
279	fBodyAcc-min()-Y	                fbodyacc.min.y
280	fBodyAcc-min()-Z	                fbodyacc.min.z
281	fBodyAcc-sma()	                        fbodyacc.sma
282	fBodyAcc-energy()-X	                fbodyacc.energy.x
283	fBodyAcc-energy()-Y	                fbodyacc.energy.y
284	fBodyAcc-energy()-Z	                fbodyacc.energy.z
285	fBodyAcc-iqr()-X	                fbodyacc.iqr.x
286	fBodyAcc-iqr()-Y	                fbodyacc.iqr.y
287	fBodyAcc-iqr()-Z	                fbodyacc.iqr.z
288	fBodyAcc-entropy()-X	                fbodyacc.entropy.x
289	fBodyAcc-entropy()-Y	                fbodyacc.entropy.y
290	fBodyAcc-entropy()-Z	                fbodyacc.entropy.z
291	fBodyAcc-maxInds-X	                fbodyacc.maxinds.x
292	fBodyAcc-maxInds-Y	                fbodyacc.maxinds.y
293	fBodyAcc-maxInds-Z	                fbodyacc.maxinds.z
294	fBodyAcc-meanFreq()-X	                fbodyacc.meanfreq.x
295	fBodyAcc-meanFreq()-Y	                fbodyacc.meanfreq.y
296	fBodyAcc-meanFreq()-Z	                fbodyacc.meanfreq.z
297	fBodyAcc-skewness()-X	                fbodyacc.skewness.x
298	fBodyAcc-kurtosis()-X	                fbodyacc.kurtosis.x
299	fBodyAcc-skewness()-Y           	fbodyacc.skewness.y
300	fBodyAcc-kurtosis()-Y           	fbodyacc.kurtosis.y
301	fBodyAcc-skewness()-Z	                fbodyacc.skewness.z
302	fBodyAcc-kurtosis()-Z	                fbodyacc.kurtosis.z
303	fBodyAcc-bandsEnergy()-1,8	        fbodyacc.bandsenergy.1.8
304	fBodyAcc-bandsEnergy()-9,16	        fbodyacc.bandsenergy.9.16
305	fBodyAcc-bandsEnergy()-17,24	        fbodyacc.bandsenergy.17.24
306	fBodyAcc-bandsEnergy()-25,32	        fbodyacc.bandsenergy.25.32
307	fBodyAcc-bandsEnergy()-33,40	        fbodyacc.bandsenergy.33.40
308	fBodyAcc-bandsEnergy()-41,48	        fbodyacc.bandsenergy.41.48
309	fBodyAcc-bandsEnergy()-49,56	        fbodyacc.bandsenergy.49.56
310	fBodyAcc-bandsEnergy()-57,64	        fbodyacc.bandsenergy.57.64
311	fBodyAcc-bandsEnergy()-1,16	        fbodyacc.bandsenergy.1.16
312	fBodyAcc-bandsEnergy()-17,32	        fbodyacc.bandsenergy.17.32
313	fBodyAcc-bandsEnergy()-33,48	        fbodyacc.bandsenergy.33.48
314	fBodyAcc-bandsEnergy()-49,64	        fbodyacc.bandsenergy.49.64
315	fBodyAcc-bandsEnergy()-1,24	        fbodyacc.bandsenergy.1.24
316	fBodyAcc-bandsEnergy()-25,48	        fbodyacc.bandsenergy.25.48
317	fBodyAcc-bandsEnergy()-1,8	        fbodyacc.bandsenergy.1.8
318	fBodyAcc-bandsEnergy()-9,16	        fbodyacc.bandsenergy.9.16
319	fBodyAcc-bandsEnergy()-17,24	        fbodyacc.bandsenergy.17.24
320	fBodyAcc-bandsEnergy()-25,32	        fbodyacc.bandsenergy.25.32
321	fBodyAcc-bandsEnergy()-33,40	        fbodyacc.bandsenergy.33.40
322	fBodyAcc-bandsEnergy()-41,48	        fbodyacc.bandsenergy.41.48
323	fBodyAcc-bandsEnergy()-49,56	        fbodyacc.bandsenergy.49.56
324	fBodyAcc-bandsEnergy()-57,64	        fbodyacc.bandsenergy.57.64
325	fBodyAcc-bandsEnergy()-1,16	        fbodyacc.bandsenergy.1.16
326	fBodyAcc-bandsEnergy()-17,32	        fbodyacc.bandsenergy.17.32
327	fBodyAcc-bandsEnergy()-33,48	        fbodyacc.bandsenergy.33.48
328	fBodyAcc-bandsEnergy()-49,64	        fbodyacc.bandsenergy.49.64
329	fBodyAcc-bandsEnergy()-1,24	        fbodyacc.bandsenergy.1.24
330	fBodyAcc-bandsEnergy()-25,48	        fbodyacc.bandsenergy.25.48
331	fBodyAcc-bandsEnergy()-1,8	        fbodyacc.bandsenergy.1.8
332	fBodyAcc-bandsEnergy()-9,16	        fbodyacc.bandsenergy.9.16
333	fBodyAcc-bandsEnergy()-17,24	        fbodyacc.bandsenergy.17.24
334	fBodyAcc-bandsEnergy()-25,32	        fbodyacc.bandsenergy.25.32
335	fBodyAcc-bandsEnergy()-33,40	        fbodyacc.bandsenergy.33.40
336	fBodyAcc-bandsEnergy()-41,48	        fbodyacc.bandsenergy.41.48
337	fBodyAcc-bandsEnergy()-49,56	        fbodyacc.bandsenergy.49.56
338	fBodyAcc-bandsEnergy()-57,64	        fbodyacc.bandsenergy.57.64
339	fBodyAcc-bandsEnergy()-1,16	        fbodyacc.bandsenergy.1.16
340	fBodyAcc-bandsEnergy()-17,32	        fbodyacc.bandsenergy.17.32
341	fBodyAcc-bandsEnergy()-33,48	        fbodyacc.bandsenergy.33.48
342	fBodyAcc-bandsEnergy()-49,64	        fbodyacc.bandsenergy.49.64
343	fBodyAcc-bandsEnergy()-1,24	        fbodyacc.bandsenergy.1.24
344	fBodyAcc-bandsEnergy()-25,48	        fbodyacc.bandsenergy.25.48
345	fBodyAccJerk-mean()-X	                fbodyaccjerk.mean.x
346	fBodyAccJerk-mean()-Y	                fbodyaccjerk.mean.y
347	fBodyAccJerk-mean()-Z	                fbodyaccjerk.mean.z
348	fBodyAccJerk-std()-X            	fbodyaccjerk.std.x
349	fBodyAccJerk-std()-Y            	fbodyaccjerk.std.y
350	fBodyAccJerk-std()-Z            	fbodyaccjerk.std.z
351	fBodyAccJerk-mad()-X            	fbodyaccjerk.mad.x
352	fBodyAccJerk-mad()-Y            	fbodyaccjerk.mad.y
353	fBodyAccJerk-mad()-Z	                fbodyaccjerk.mad.z
354	fBodyAccJerk-max()-X	                fbodyaccjerk.max.x
355	fBodyAccJerk-max()-Y	                fbodyaccjerk.max.y
356	fBodyAccJerk-max()-Z	                fbodyaccjerk.max.z
357	fBodyAccJerk-min()-X	                fbodyaccjerk.min.x
358	fBodyAccJerk-min()-Y	                fbodyaccjerk.min.y
359	fBodyAccJerk-min()-Z	                fbodyaccjerk.min.z
360	fBodyAccJerk-sma()	                fbodyaccjerk.sma
361	fBodyAccJerk-energy()-X	                fbodyaccjerk.energy.x
362	fBodyAccJerk-energy()-Y	                fbodyaccjerk.energy.y
363	fBodyAccJerk-energy()-Z	                fbodyaccjerk.energy.z
364	fBodyAccJerk-iqr()-X	                fbodyaccjerk.iqr.x
365	fBodyAccJerk-iqr()-Y	                fbodyaccjerk.iqr.y
366	fBodyAccJerk-iqr()-Z	                fbodyaccjerk.iqr.z
367	fBodyAccJerk-entropy()-X        	fbodyaccjerk.entropy.x
368	fBodyAccJerk-entropy()-Y	        fbodyaccjerk.entropy.y
369	fBodyAccJerk-entropy()-Z        	fbodyaccjerk.entropy.z
370	fBodyAccJerk-maxInds-X	                fbodyaccjerk.maxinds.x
371	fBodyAccJerk-maxInds-Y	                fbodyaccjerk.maxinds.y
372	fBodyAccJerk-maxInds-Z	                fbodyaccjerk.maxinds.z
373	fBodyAccJerk-meanFreq()-X       	fbodyaccjerk.meanfreq.x
374	fBodyAccJerk-meanFreq()-Y	        fbodyaccjerk.meanfreq.y
375	fBodyAccJerk-meanFreq()-Z	        fbodyaccjerk.meanfreq.z
376	fBodyAccJerk-skewness()-X	        fbodyaccjerk.skewness.x
377	fBodyAccJerk-kurtosis()-X	        fbodyaccjerk.kurtosis.x
378	fBodyAccJerk-skewness()-Y	        fbodyaccjerk.skewness.y
379	fBodyAccJerk-kurtosis()-Y       	fbodyaccjerk.kurtosis.y
380	fBodyAccJerk-skewness()-Z       	fbodyaccjerk.skewness.z
381	fBodyAccJerk-kurtosis()-Z	        fbodyaccjerk.kurtosis.z
382	fBodyAccJerk-bandsEnergy()-1,8	        fbodyaccjerk.bandsenergy.1.8
383	fBodyAccJerk-bandsEnergy()-9,16	        fbodyaccjerk.bandsenergy.9.16
384	fBodyAccJerk-bandsEnergy()-17,24	fbodyaccjerk.bandsenergy.17.24
385	fBodyAccJerk-bandsEnergy()-25,32	fbodyaccjerk.bandsenergy.25.32
386	fBodyAccJerk-bandsEnergy()-33,40	fbodyaccjerk.bandsenergy.33.40
387	fBodyAccJerk-bandsEnergy()-41,48	fbodyaccjerk.bandsenergy.41.48
388	fBodyAccJerk-bandsEnergy()-49,56	fbodyaccjerk.bandsenergy.49.56
389	fBodyAccJerk-bandsEnergy()-57,64	fbodyaccjerk.bandsenergy.57.64
390	fBodyAccJerk-bandsEnergy()-1,16	        fbodyaccjerk.bandsenergy.1.16
391	fBodyAccJerk-bandsEnergy()-17,32	fbodyaccjerk.bandsenergy.17.32
392	fBodyAccJerk-bandsEnergy()-33,48	fbodyaccjerk.bandsenergy.33.48
393	fBodyAccJerk-bandsEnergy()-49,64	fbodyaccjerk.bandsenergy.49.64
394	fBodyAccJerk-bandsEnergy()-1,24	        fbodyaccjerk.bandsenergy.1.24
395	fBodyAccJerk-bandsEnergy()-25,48	fbodyaccjerk.bandsenergy.25.48
396	fBodyAccJerk-bandsEnergy()-1,8	        fbodyaccjerk.bandsenergy.1.8
397	fBodyAccJerk-bandsEnergy()-9,16	        fbodyaccjerk.bandsenergy.9.16
398	fBodyAccJerk-bandsEnergy()-17,24	fbodyaccjerk.bandsenergy.17.24
399	fBodyAccJerk-bandsEnergy()-25,32	fbodyaccjerk.bandsenergy.25.32
400	fBodyAccJerk-bandsEnergy()-33,40	fbodyaccjerk.bandsenergy.33.40
401	fBodyAccJerk-bandsEnergy()-41,48	fbodyaccjerk.bandsenergy.41.48
402	fBodyAccJerk-bandsEnergy()-49,56	fbodyaccjerk.bandsenergy.49.56
403	fBodyAccJerk-bandsEnergy()-57,64	fbodyaccjerk.bandsenergy.57.64
404	fBodyAccJerk-bandsEnergy()-1,16	        fbodyaccjerk.bandsenergy.1.16
405	fBodyAccJerk-bandsEnergy()-17,32	fbodyaccjerk.bandsenergy.17.32
406	fBodyAccJerk-bandsEnergy()-33,48	fbodyaccjerk.bandsenergy.33.48
407	fBodyAccJerk-bandsEnergy()-49,64	fbodyaccjerk.bandsenergy.49.64
408	fBodyAccJerk-bandsEnergy()-1,24	        fbodyaccjerk.bandsenergy.1.24
409	fBodyAccJerk-bandsEnergy()-25,48	fbodyaccjerk.bandsenergy.25.48
410	fBodyAccJerk-bandsEnergy()-1,8	        fbodyaccjerk.bandsenergy.1.8
411	fBodyAccJerk-bandsEnergy()-9,16	        fbodyaccjerk.bandsenergy.9.16
412	fBodyAccJerk-bandsEnergy()-17,24	fbodyaccjerk.bandsenergy.17.24
413	fBodyAccJerk-bandsEnergy()-25,32	fbodyaccjerk.bandsenergy.25.32
414	fBodyAccJerk-bandsEnergy()-33,40	fbodyaccjerk.bandsenergy.33.40
415	fBodyAccJerk-bandsEnergy()-41,48	fbodyaccjerk.bandsenergy.41.48
416	fBodyAccJerk-bandsEnergy()-49,56	fbodyaccjerk.bandsenergy.49.56
417	fBodyAccJerk-bandsEnergy()-57,64	fbodyaccjerk.bandsenergy.57.64
418	fBodyAccJerk-bandsEnergy()-1,16	        fbodyaccjerk.bandsenergy.1.16
419	fBodyAccJerk-bandsEnergy()-17,32	fbodyaccjerk.bandsenergy.17.32
420	fBodyAccJerk-bandsEnergy()-33,48	fbodyaccjerk.bandsenergy.33.48
421	fBodyAccJerk-bandsEnergy()-49,64	fbodyaccjerk.bandsenergy.49.64
422	fBodyAccJerk-bandsEnergy()-1,24	        fbodyaccjerk.bandsenergy.1.24
423	fBodyAccJerk-bandsEnergy()-25,48	fbodyaccjerk.bandsenergy.25.48
424	fBodyGyro-mean()-X              	fbodygyro.mean.x
425	fBodyGyro-mean()-Y	                fbodygyro.mean.y
426	fBodyGyro-mean()-Z	                fbodygyro.mean.z
427	fBodyGyro-std()-X	                fbodygyro.std.x
428	fBodyGyro-std()-Y               	fbodygyro.std.y
429	fBodyGyro-std()-Z	                fbodygyro.std.z
430	fBodyGyro-mad()-X               	fbodygyro.mad.x
431	fBodyGyro-mad()-Y               	fbodygyro.mad.y
432	fBodyGyro-mad()-Z               	fbodygyro.mad.z
433	fBodyGyro-max()-X	                fbodygyro.max.x
434	fBodyGyro-max()-Y	                fbodygyro.max.y
435	fBodyGyro-max()-Z	                fbodygyro.max.z
436	fBodyGyro-min()-X	                fbodygyro.min.x
437	fBodyGyro-min()-Y	                fbodygyro.min.y
438	fBodyGyro-min()-Z	                fbodygyro.min.z
439	fBodyGyro-sma()	                        fbodygyro.sma
440	fBodyGyro-energy()-X            	fbodygyro.energy.x
441	fBodyGyro-energy()-Y	                fbodygyro.energy.y
442	fBodyGyro-energy()-Z	                fbodygyro.energy.z
443	fBodyGyro-iqr()-X	                fbodygyro.iqr.x
444	fBodyGyro-iqr()-Y	                fbodygyro.iqr.y
445	fBodyGyro-iqr()-Z	                fbodygyro.iqr.z
446	fBodyGyro-entropy()-X	                fbodygyro.entropy.x
447	fBodyGyro-entropy()-Y           	fbodygyro.entropy.y
448	fBodyGyro-entropy()-Z	               fbodygyro.entropy.z
449	fBodyGyro-maxInds-X	                fbodygyro.maxinds.x
450	fBodyGyro-maxInds-Y	                fbodygyro.maxinds.y
451	fBodyGyro-maxInds-Z	                fbodygyro.maxinds.z
452	fBodyGyro-meanFreq()-X	                fbodygyro.meanfreq.x
453	fBodyGyro-meanFreq()-Y	                fbodygyro.meanfreq.y
454	fBodyGyro-meanFreq()-Z	                fbodygyro.meanfreq.z
455	fBodyGyro-skewness()-X	                fbodygyro.skewness.x
456	fBodyGyro-kurtosis()-X	                fbodygyro.kurtosis.x
457	fBodyGyro-skewness()-Y	                fbodygyro.skewness.y
458	fBodyGyro-kurtosis()-Y	                fbodygyro.kurtosis.y
459	fBodyGyro-skewness()-Z	                fbodygyro.skewness.z
460	fBodyGyro-kurtosis()-Z	                fbodygyro.kurtosis.z
461	fBodyGyro-bandsEnergy()-1,8	        fbodygyro.bandsenergy.1.8
462	fBodyGyro-bandsEnergy()-9,16	        fbodygyro.bandsenergy.9.16
463	fBodyGyro-bandsEnergy()-17,24	        fbodygyro.bandsenergy.17.24
464	fBodyGyro-bandsEnergy()-25,32	        fbodygyro.bandsenergy.25.32
465	fBodyGyro-bandsEnergy()-33,40	        fbodygyro.bandsenergy.33.40
466	fBodyGyro-bandsEnergy()-41,48	        fbodygyro.bandsenergy.41.48
467	fBodyGyro-bandsEnergy()-49,56	        fbodygyro.bandsenergy.49.56
468	fBodyGyro-bandsEnergy()-57,64	        fbodygyro.bandsenergy.57.64
469	fBodyGyro-bandsEnergy()-1,16	        fbodygyro.bandsenergy.1.16
470	fBodyGyro-bandsEnergy()-17,32	        fbodygyro.bandsenergy.17.32
471	fBodyGyro-bandsEnergy()-33,48	        fbodygyro.bandsenergy.33.48
472	fBodyGyro-bandsEnergy()-49,64	        fbodygyro.bandsenergy.49.64
473	fBodyGyro-bandsEnergy()-1,24	        fbodygyro.bandsenergy.1.24
474	fBodyGyro-bandsEnergy()-25,48	        fbodygyro.bandsenergy.25.48
475	fBodyGyro-bandsEnergy()-1,8	        fbodygyro.bandsenergy.1.8
476	fBodyGyro-bandsEnergy()-9,16	        fbodygyro.bandsenergy.9.16
477	fBodyGyro-bandsEnergy()-17,24	        fbodygyro.bandsenergy.17.24
478	fBodyGyro-bandsEnergy()-25,32	        fbodygyro.bandsenergy.25.32
479	fBodyGyro-bandsEnergy()-33,40	        fbodygyro.bandsenergy.33.40
480	fBodyGyro-bandsEnergy()-41,48	        fbodygyro.bandsenergy.41.48
481	fBodyGyro-bandsEnergy()-49,56	        fbodygyro.bandsenergy.49.56
482	fBodyGyro-bandsEnergy()-57,64	        fbodygyro.bandsenergy.57.64
483	fBodyGyro-bandsEnergy()-1,16	        fbodygyro.bandsenergy.1.16
484	fBodyGyro-bandsEnergy()-17,32	        fbodygyro.bandsenergy.17.32
485	fBodyGyro-bandsEnergy()-33,48	        fbodygyro.bandsenergy.33.48
486	fBodyGyro-bandsEnergy()-49,64	        fbodygyro.bandsenergy.49.64
487	fBodyGyro-bandsEnergy()-1,24	        fbodygyro.bandsenergy.1.24
488	fBodyGyro-bandsEnergy()-25,48	        fbodygyro.bandsenergy.25.48
489	fBodyGyro-bandsEnergy()-1,8	        fbodygyro.bandsenergy.1.8
490	fBodyGyro-bandsEnergy()-9,16	        fbodygyro.bandsenergy.9.16
491	fBodyGyro-bandsEnergy()-17,24	        fbodygyro.bandsenergy.17.24
492	fBodyGyro-bandsEnergy()-25,32	        fbodygyro.bandsenergy.25.32
493	fBodyGyro-bandsEnergy()-33,40	        fbodygyro.bandsenergy.33.40
494	fBodyGyro-bandsEnergy()-41,48	        fbodygyro.bandsenergy.41.48
495	fBodyGyro-bandsEnergy()-49,56	        fbodygyro.bandsenergy.49.56
496	fBodyGyro-bandsEnergy()-57,64	        fbodygyro.bandsenergy.57.64
497	fBodyGyro-bandsEnergy()-1,16	        fbodygyro.bandsenergy.1.16
498	fBodyGyro-bandsEnergy()-17,32	        fbodygyro.bandsenergy.17.32
499	fBodyGyro-bandsEnergy()-33,48	        fbodygyro.bandsenergy.33.48
500	fBodyGyro-bandsEnergy()-49,64	        fbodygyro.bandsenergy.49.64
501	fBodyGyro-bandsEnergy()-1,24	        fbodygyro.bandsenergy.1.24
502	fBodyGyro-bandsEnergy()-25,48	        fbodygyro.bandsenergy.25.48
503	fBodyAccMag-mean()	                fbodyaccmag.mean
504	fBodyAccMag-std()	                fbodyaccmag.std
505	fBodyAccMag-mad()	                fbodyaccmag.mad
506	fBodyAccMag-max()	                fbodyaccmag.max
507	fBodyAccMag-min()	                fbodyaccmag.min
508	fBodyAccMag-sma()	                fbodyaccmag.sma
509	fBodyAccMag-energy()	                fbodyaccmag.energy
510	fBodyAccMag-iqr()	                fbodyaccmag.iqr
511	fBodyAccMag-entropy()	                fbodyaccmag.entropy
512	fBodyAccMag-maxInds	                fbodyaccmag.maxinds
513	fBodyAccMag-meanFreq()	                fbodyaccmag.meanfreq
514	fBodyAccMag-skewness()	                fbodyaccmag.skewness
515	fBodyAccMag-kurtosis()	                fbodyaccmag.kurtosis
516	fBodyBodyAccJerkMag-mean()	        fbodybodyaccjerkmag.mean
517	fBodyBodyAccJerkMag-std()	        fbodybodyaccjerkmag.std
518	fBodyBodyAccJerkMag-mad()	        fbodybodyaccjerkmag.mad
519	fBodyBodyAccJerkMag-max()	        fbodybodyaccjerkmag.max
520	fBodyBodyAccJerkMag-min()       	fbodybodyaccjerkmag.min
521	fBodyBodyAccJerkMag-sma()	        fbodybodyaccjerkmag.sma
522	fBodyBodyAccJerkMag-energy()    	fbodybodyaccjerkmag.energy
523	fBodyBodyAccJerkMag-iqr()       	fbodybodyaccjerkmag.iqr
524	fBodyBodyAccJerkMag-entropy()	        fbodybodyaccjerkmag.entropy
525	fBodyBodyAccJerkMag-maxInds	        fbodybodyaccjerkmag.maxinds
526	fBodyBodyAccJerkMag-meanFreq()	        fbodybodyaccjerkmag.meanfreq
527	fBodyBodyAccJerkMag-skewness()	        fbodybodyaccjerkmag.skewness
528	fBodyBodyAccJerkMag-kurtosis()	        fbodybodyaccjerkmag.kurtosis
529	fBodyBodyGyroMag-mean()	                fbodybodygyromag.mean
530	fBodyBodyGyroMag-std()	                fbodybodygyromag.std
531	fBodyBodyGyroMag-mad()	                fbodybodygyromag.mad
532	fBodyBodyGyroMag-max()	                fbodybodygyromag.max
533	fBodyBodyGyroMag-min()	                fbodybodygyromag.min
534	fBodyBodyGyroMag-sma()	                fbodybodygyromag.sma
535	fBodyBodyGyroMag-energy()	        fbodybodygyromag.energy
536	fBodyBodyGyroMag-iqr()	                fbodybodygyromag.iqr
537	fBodyBodyGyroMag-entropy()	        fbodybodygyromag.entropy
538	fBodyBodyGyroMag-maxInds	        fbodybodygyromag.maxinds
539	fBodyBodyGyroMag-meanFreq()	        fbodybodygyromag.meanfreq
540	fBodyBodyGyroMag-skewness()	        fbodybodygyromag.skewness
541	fBodyBodyGyroMag-kurtosis()	        fbodybodygyromag.kurtosis
542	fBodyBodyGyroJerkMag-mean()	        fbodybodygyrojerkmag.mean
543	fBodyBodyGyroJerkMag-std()	        fbodybodygyrojerkmag.std
544	fBodyBodyGyroJerkMag-mad()	        fbodybodygyrojerkmag.mad
545	fBodyBodyGyroJerkMag-max()	        fbodybodygyrojerkmag.max
546	fBodyBodyGyroJerkMag-min()	        fbodybodygyrojerkmag.min
547	fBodyBodyGyroJerkMag-sma()	        fbodybodygyrojerkmag.sma
548	fBodyBodyGyroJerkMag-energy()	        fbodybodygyrojerkmag.energy
549	fBodyBodyGyroJerkMag-iqr()	        fbodybodygyrojerkmag.iqr
550	fBodyBodyGyroJerkMag-entropy()	        fbodybodygyrojerkmag.entropy
551	fBodyBodyGyroJerkMag-maxInds	        fbodybodygyrojerkmag.maxinds
552	fBodyBodyGyroJerkMag-meanFreq()	        fbodybodygyrojerkmag.meanfreq
553	fBodyBodyGyroJerkMag-skewness()	        fbodybodygyrojerkmag.skewness
554	fBodyBodyGyroJerkMag-kurtosis()	        fbodybodygyrojerkmag.kurtosis
555	angle(tBodyAccMean,gravity)	        angle.tbodyaccmean.gravity
556	angle(tBodyAccJerkMean),gravityMean)	angle.tbodyaccjerkmean.gravitymean
557	angle(tBodyGyroMean,gravityMean)	angle.tbodygyromean.gravitymean
558	angle(tBodyGyroJerkMean,gravityMean)	angle.tbodygyrojerkmean.gravitymean
559	angle(X,gravityMean)	                angle.x.gravitymean
560	angle(Y,gravityMean)	                angle.y.gravitymean
561	angle(Z,gravityMean)	                angle.z.gravitymean


FINAL OUTPUT VARIABLES

The following 88 variables were included in the output file data5.txt.  They include the subject, activity, and all variables related to mean and standard deviation.

[1] "activity"                            "subject"                            
 [3] "tbodyacc.mean.x"                     "tbodyacc.mean.y"                    
 [5] "tbodyacc.mean.z"                     "tbodyacc.std.x"                     
 [7] "tbodyacc.std.y"                      "tbodyacc.std.z"                     
 [9] "tgravityacc.mean.x"                  "tgravityacc.mean.y"                 
[11] "tgravityacc.mean.z"                  "tgravityacc.std.x"                  
[13] "tgravityacc.std.y"                   "tgravityacc.std.z"                  
[15] "tbodyaccjerk.mean.x"                 "tbodyaccjerk.mean.y"                
[17] "tbodyaccjerk.mean.z"                 "tbodyaccjerk.std.x"                 
[19] "tbodyaccjerk.std.y"                  "tbodyaccjerk.std.z"                 
[21] "tbodygyro.mean.x"                    "tbodygyro.mean.y"                   
[23] "tbodygyro.mean.z"                    "tbodygyro.std.x"                    
[25] "tbodygyro.std.y"                     "tbodygyro.std.z"                    
[27] "tbodygyrojerk.mean.x"                "tbodygyrojerk.mean.y"               
[29] "tbodygyrojerk.mean.z"                "tbodygyrojerk.std.x"                
[31] "tbodygyrojerk.std.y"                 "tbodygyrojerk.std.z"                
[33] "tbodyaccmag.mean"                    "tbodyaccmag.std"                    
[35] "tgravityaccmag.mean"                 "tgravityaccmag.std"                 
[37] "tbodyaccjerkmag.mean"                "tbodyaccjerkmag.std"                
[39] "tbodygyromag.mean"                   "tbodygyromag.std"                   
[41] "tbodygyrojerkmag.mean"               "tbodygyrojerkmag.std"               
[43] "fbodyacc.mean.x"                     "fbodyacc.mean.y"                    
[45] "fbodyacc.mean.z"                     "fbodyacc.std.x"                     
[47] "fbodyacc.std.y"                      "fbodyacc.std.z"                     
[49] "fbodyacc.meanfreq.x"                 "fbodyacc.meanfreq.y"                
[51] "fbodyacc.meanfreq.z"                 "fbodyaccjerk.mean.x"                
[53] "fbodyaccjerk.mean.y"                 "fbodyaccjerk.mean.z"                
[55] "fbodyaccjerk.std.x"                  "fbodyaccjerk.std.y"                 
[57] "fbodyaccjerk.std.z"                  "fbodyaccjerk.meanfreq.x"            
[59] "fbodyaccjerk.meanfreq.y"             "fbodyaccjerk.meanfreq.z"            
[61] "fbodygyro.mean.x"                    "fbodygyro.mean.y"                   
[63] "fbodygyro.mean.z"                    "fbodygyro.std.x"                    
[65] "fbodygyro.std.y"                     "fbodygyro.std.z"                    
[67] "fbodygyro.meanfreq.x"                "fbodygyro.meanfreq.y"               
[69] "fbodygyro.meanfreq.z"                "fbodyaccmag.mean"                   
[71] "fbodyaccmag.std"                     "fbodyaccmag.meanfreq"               
[73] "fbodybodyaccjerkmag.mean"            "fbodybodyaccjerkmag.std"            
[75] "fbodybodyaccjerkmag.meanfreq"        "fbodybodygyromag.mean"              
[77] "fbodybodygyromag.std"                "fbodybodygyromag.meanfreq"          
[79] "fbodybodygyrojerkmag.mean"           "fbodybodygyrojerkmag.std"           
[81] "fbodybodygyrojerkmag.meanfreq"       "angle.tbodyaccmean.gravity"         
[83] "angle.tbodyaccjerkmean.gravitymean"  "angle.tbodygyromean.gravitymean"    
[85] "angle.tbodygyrojerkmean.gravitymean" "angle.x.gravitymean"                
[87] "angle.y.gravitymean"                 "angle.z.gravitymean"      
