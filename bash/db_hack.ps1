New-Item -Path "C:\Hadoop\Bin" -ItemType Directory -Force

Invoke-WebRequest -Uri https://github.com/steveloughran/winutils/raw/master/hadoop-2.7.1/bin/winutils.exe -OutFile "C:\Hadoop\Bin\winutils.exe"

[Environment]::SetEnvironmentVariable("HADOOP_HOME", "C:\Hadoop", "Machine")