
SET VER=2.1.0.0

SET MSB="C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe"
SET MSB_ARG=/tv:15.0 /t:Build

SET CFG=Extension
%MSB% ..\ReoGrid\ReoGrid.csproj %MSB_ARG% /p:Configuration=%CFG%;TargetFrameworkVersion=v3.5,Profile=Client
copy ..\ReoGrid\bin\%CFG%\unvell.ReoGrid.dll ..\packages\lib\20\ /y
copy ..\ReoGrid\bin\%CFG%\unvell.ReoGrid.xml ..\packages\lib\20\ /y

cd ..\packages

..\NuGet pack ..\ReoGrid\ReoGrid.csproj -Version %VER% 

cd ..

SET CFG=WPFExtension
%MSB% ..\ReoGrid\ReoGrid.csproj %MSB_ARG% /p:Configuration=%CFG%;TargetFrameworkVersion=v3.5,Profile=Client
copy ..\ReoGrid\Bin\%CFG%\unvell.ReoGrid.dll ..\packages-wpf\lib\20\ /y
copy ..\ReoGrid\Bin\%CFG%\unvell.ReoGrid.xml ..\packages-wpf\lib\20\ /y

cd packages-wpf

..\NuGet pack ..\ReoGrid\ReoGrid.csproj -Version %VER%

cd ..

pause
