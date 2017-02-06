


</head>

<body>
<h1>Codebook</h1>

<h2>Variable list and descriptions</h2>

<table><thead>
<tr>
<th>Variable name</th>
<th>Description</th>
</tr>
</thead><tbody>
<tr>
<td>subject</td>
<td>ID the subject who performed the activity for each window sample. Its range is from 1 to 30.</td>
</tr>
<tr>
<td>activity</td>
<td>Activity name</td>
</tr>
<tr>
<td>featDomain</td>
<td>Feature: Time domain signal or frequency domain signal (Time or Freq)</td>
</tr>
<tr>
<td>featInstrument</td>
<td>Feature: Measuring instrument (Accelerometer or Gyroscope)</td>
</tr>
<tr>
<td>featAcceleration</td>
<td>Feature: Acceleration signal (Body or Gravity)</td>
</tr>
<tr>
<td>featVariable</td>
<td>Feature: Variable (Mean or SD)</td>
</tr>
<tr>
<td>featJerk</td>
<td>Feature: Jerk signal</td>
</tr>
<tr>
<td>featMagnitude</td>
<td>Feature: Magnitude of the signals calculated using the Euclidean norm</td>
</tr>
<tr>
<td>featAxis</td>
<td>Feature: 3-axial signals in the X, Y and Z directions (X, Y, or Z)</td>
</tr>
<tr>
<td>featCount</td>
<td>Feature: Count of data points used to compute <code>average</code></td>
</tr>
<tr>
<td>featAverage</td>
<td>Feature: Average of each variable for each activity and each subject</td>
</tr>
</tbody></table>

<h2>Dataset structure</h2>

<pre><code class="r">str(dtTidy)
</code></pre>

<pre><code>## Classes &#39;data.table&#39; and &#39;data.frame&#39;:   11880 obs. of  11 variables:
##  $ subject         : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ activity        : Factor w/ 6 levels &quot;LAYING&quot;,&quot;SITTING&quot;,..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ featDomain      : Factor w/ 2 levels &quot;Time&quot;,&quot;Freq&quot;: 1 1 1 1 1 1 1 1 1 1 ...
##  $ featAcceleration: Factor w/ 3 levels NA,&quot;Body&quot;,&quot;Gravity&quot;: 1 1 1 1 1 1 1 1 1 1 ...
##  $ featInstrument  : Factor w/ 2 levels &quot;Accelerometer&quot;,..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ featJerk        : Factor w/ 2 levels NA,&quot;Jerk&quot;: 1 1 1 1 1 1 1 1 2 2 ...
##  $ featMagnitude   : Factor w/ 2 levels NA,&quot;Magnitude&quot;: 1 1 1 1 1 1 2 2 1 1 ...
##  $ featVariable    : Factor w/ 2 levels &quot;Mean&quot;,&quot;SD&quot;: 1 1 1 2 2 2 1 2 1 1 ...
##  $ featAxis        : Factor w/ 4 levels NA,&quot;X&quot;,&quot;Y&quot;,&quot;Z&quot;: 2 3 4 2 3 4 1 1 2 3 ...
##  $ count           : int  50 50 50 50 50 50 50 50 50 50 ...
##  $ average         : num  -0.0166 -0.0645 0.1487 -0.8735 -0.9511 ...
##  - attr(*, &quot;sorted&quot;)= chr  &quot;subject&quot; &quot;activity&quot; &quot;featDomain&quot; &quot;featAcceleration&quot; ...
##  - attr(*, &quot;.internal.selfref&quot;)=&lt;externalptr&gt;
</code></pre>

<h2>List the key variables in the data table</h2>

<pre><code class="r">key(dtTidy)
</code></pre>

<pre><code>## [1] &quot;subject&quot;          &quot;activity&quot;         &quot;featDomain&quot;      
## [4] &quot;featAcceleration&quot; &quot;featInstrument&quot;   &quot;featJerk&quot;        
## [7] &quot;featMagnitude&quot;    &quot;featVariable&quot;     &quot;featAxis&quot;
</code></pre>

<h2>Show a few rows of the dataset</h2>

<pre><code class="r">dtTidy
</code></pre>

<pre><code>##        subject         activity featDomain featAcceleration featInstrument
##     1:       1           LAYING       Time               NA      Gyroscope
##     2:       1           LAYING       Time               NA      Gyroscope
##     3:       1           LAYING       Time               NA      Gyroscope
##     4:       1           LAYING       Time               NA      Gyroscope
##     5:       1           LAYING       Time               NA      Gyroscope
##    ---                                                                    
## 11876:      30 WALKING_UPSTAIRS       Freq             Body  Accelerometer
## 11877:      30 WALKING_UPSTAIRS       Freq             Body  Accelerometer
## 11878:      30 WALKING_UPSTAIRS       Freq             Body  Accelerometer
## 11879:      30 WALKING_UPSTAIRS       Freq             Body  Accelerometer
## 11880:      30 WALKING_UPSTAIRS       Freq             Body  Accelerometer
##        featJerk featMagnitude featVariable featAxis count  average
##     1:       NA            NA         Mean        X    50 -0.01655
##     2:       NA            NA         Mean        Y    50 -0.06449
##     3:       NA            NA         Mean        Z    50  0.14869
##     4:       NA            NA           SD        X    50 -0.87354
##     5:       NA            NA           SD        Y    50 -0.95109
##    ---                                                            
## 11876:     Jerk            NA           SD        X    65 -0.56157
## 11877:     Jerk            NA           SD        Y    65 -0.61083
## 11878:     Jerk            NA           SD        Z    65 -0.78475
## 11879:     Jerk     Magnitude         Mean       NA    65 -0.54978
## 11880:     Jerk     Magnitude           SD       NA    65 -0.58088
</code></pre>

<h2>Summary of variables</h2>

<pre><code class="r">summary(dtTidy)
</code></pre>

<pre><code>##     subject                   activity    featDomain  featAcceleration
##  Min.   : 1.0   LAYING            :1980   Time:7200   NA     :4680    
##  1st Qu.: 8.0   SITTING           :1980   Freq:4680   Body   :5760    
##  Median :15.5   STANDING          :1980               Gravity:1440    
##  Mean   :15.5   WALKING           :1980                               
##  3rd Qu.:23.0   WALKING_DOWNSTAIRS:1980                               
##  Max.   :30.0   WALKING_UPSTAIRS  :1980                               
##        featInstrument featJerk      featMagnitude  featVariable featAxis 
##  Accelerometer:7200   NA  :7200   NA       :8640   Mean:5940    NA:3240  
##  Gyroscope    :4680   Jerk:4680   Magnitude:3240   SD  :5940    X :2880  
##                                                                 Y :2880  
##                                                                 Z :2880  
##                                                                          
##                                                                          
##      count         average       
##  Min.   :36.0   Min.   :-0.9977  
##  1st Qu.:49.0   1st Qu.:-0.9621  
##  Median :54.5   Median :-0.4699  
##  Mean   :57.2   Mean   :-0.4844  
##  3rd Qu.:63.2   3rd Qu.:-0.0784  
##  Max.   :95.0   Max.   : 0.9745
</code></pre>

<h2>List all possible combinations of features</h2>

<pre><code class="r">dtTidy[, .N, by = c(names(dtTidy)[grep(&quot;^feat&quot;, names(dtTidy))])]
</code></pre>

<pre><code>##     featDomain featAcceleration featInstrument featJerk featMagnitude
##  1:       Time               NA      Gyroscope       NA            NA
##  2:       Time               NA      Gyroscope       NA            NA
##  3:       Time               NA      Gyroscope       NA            NA
##  4:       Time               NA      Gyroscope       NA            NA
##  5:       Time               NA      Gyroscope       NA            NA
##  6:       Time               NA      Gyroscope       NA            NA
##  7:       Time               NA      Gyroscope       NA     Magnitude
##  8:       Time               NA      Gyroscope       NA     Magnitude
##  9:       Time               NA      Gyroscope     Jerk            NA
## 10:       Time               NA      Gyroscope     Jerk            NA
## 11:       Time               NA      Gyroscope     Jerk            NA
## 12:       Time               NA      Gyroscope     Jerk            NA
## 13:       Time               NA      Gyroscope     Jerk            NA
## 14:       Time               NA      Gyroscope     Jerk            NA
## 15:       Time               NA      Gyroscope     Jerk     Magnitude
## 16:       Time               NA      Gyroscope     Jerk     Magnitude
## 17:       Time             Body  Accelerometer       NA            NA
## 18:       Time             Body  Accelerometer       NA            NA
## 19:       Time             Body  Accelerometer       NA            NA
## 20:       Time             Body  Accelerometer       NA            NA
## 21:       Time             Body  Accelerometer       NA            NA
## 22:       Time             Body  Accelerometer       NA            NA
## 23:       Time             Body  Accelerometer       NA     Magnitude
## 24:       Time             Body  Accelerometer       NA     Magnitude
## 25:       Time             Body  Accelerometer     Jerk            NA
## 26:       Time             Body  Accelerometer     Jerk            NA
## 27:       Time             Body  Accelerometer     Jerk            NA
## 28:       Time             Body  Accelerometer     Jerk            NA
## 29:       Time             Body  Accelerometer     Jerk            NA
## 30:       Time             Body  Accelerometer     Jerk            NA
## 31:       Time             Body  Accelerometer     Jerk     Magnitude
## 32:       Time             Body  Accelerometer     Jerk     Magnitude
## 33:       Time          Gravity  Accelerometer       NA            NA
## 34:       Time          Gravity  Accelerometer       NA            NA
## 35:       Time          Gravity  Accelerometer       NA            NA
## 36:       Time          Gravity  Accelerometer       NA            NA
## 37:       Time          Gravity  Accelerometer       NA            NA
## 38:       Time          Gravity  Accelerometer       NA            NA
## 39:       Time          Gravity  Accelerometer       NA     Magnitude
## 40:       Time          Gravity  Accelerometer       NA     Magnitude
## 41:       Freq               NA      Gyroscope       NA            NA
## 42:       Freq               NA      Gyroscope       NA            NA
## 43:       Freq               NA      Gyroscope       NA            NA
## 44:       Freq               NA      Gyroscope       NA            NA
## 45:       Freq               NA      Gyroscope       NA            NA
## 46:       Freq               NA      Gyroscope       NA            NA
## 47:       Freq               NA      Gyroscope       NA     Magnitude
## 48:       Freq               NA      Gyroscope       NA     Magnitude
## 49:       Freq               NA      Gyroscope     Jerk     Magnitude
## 50:       Freq               NA      Gyroscope     Jerk     Magnitude
## 51:       Freq             Body  Accelerometer       NA            NA
## 52:       Freq             Body  Accelerometer       NA            NA
## 53:       Freq             Body  Accelerometer       NA            NA
## 54:       Freq             Body  Accelerometer       NA            NA
## 55:       Freq             Body  Accelerometer       NA            NA
## 56:       Freq             Body  Accelerometer       NA            NA
## 57:       Freq             Body  Accelerometer       NA     Magnitude
## 58:       Freq             Body  Accelerometer       NA     Magnitude
## 59:       Freq             Body  Accelerometer     Jerk            NA
## 60:       Freq             Body  Accelerometer     Jerk            NA
## 61:       Freq             Body  Accelerometer     Jerk            NA
## 62:       Freq             Body  Accelerometer     Jerk            NA
## 63:       Freq             Body  Accelerometer     Jerk            NA
## 64:       Freq             Body  Accelerometer     Jerk            NA
## 65:       Freq             Body  Accelerometer     Jerk     Magnitude
## 66:       Freq             Body  Accelerometer     Jerk     Magnitude
##     featDomain featAcceleration featInstrument featJerk featMagnitude
##     featVariable featAxis   N
##  1:         Mean        X 180
##  2:         Mean        Y 180
##  3:         Mean        Z 180
##  4:           SD        X 180
##  5:           SD        Y 180
##  6:           SD        Z 180
##  7:         Mean       NA 180
##  8:           SD       NA 180
##  9:         Mean        X 180
## 10:         Mean        Y 180
## 11:         Mean        Z 180
## 12:           SD        X 180
## 13:           SD        Y 180
## 14:           SD        Z 180
## 15:         Mean       NA 180
## 16:           SD       NA 180
## 17:         Mean        X 180
## 18:         Mean        Y 180
## 19:         Mean        Z 180
## 20:           SD        X 180
## 21:           SD        Y 180
## 22:           SD        Z 180
## 23:         Mean       NA 180
## 24:           SD       NA 180
## 25:         Mean        X 180
## 26:         Mean        Y 180
## 27:         Mean        Z 180
## 28:           SD        X 180
## 29:           SD        Y 180
## 30:           SD        Z 180
## 31:         Mean       NA 180
## 32:           SD       NA 180
## 33:         Mean        X 180
## 34:         Mean        Y 180
## 35:         Mean        Z 180
## 36:           SD        X 180
## 37:           SD        Y 180
## 38:           SD        Z 180
## 39:         Mean       NA 180
## 40:           SD       NA 180
## 41:         Mean        X 180
## 42:         Mean        Y 180
## 43:         Mean        Z 180
## 44:           SD        X 180
## 45:           SD        Y 180
## 46:           SD        Z 180
## 47:         Mean       NA 180
## 48:           SD       NA 180
## 49:         Mean       NA 180
## 50:           SD       NA 180
## 51:         Mean        X 180
## 52:         Mean        Y 180
## 53:         Mean        Z 180
## 54:           SD        X 180
## 55:           SD        Y 180
## 56:           SD        Z 180
## 57:         Mean       NA 180
## 58:           SD       NA 180
## 59:         Mean        X 180
## 60:         Mean        Y 180
## 61:         Mean        Z 180
## 62:           SD        X 180
## 63:           SD        Y 180
## 64:           SD        Z 180
## 65:         Mean       NA 180
## 66:           SD       NA 180
##     featVariable featAxis   N
</code></pre>



</body>

</html>
