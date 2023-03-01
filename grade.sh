CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f ListExamples.java ]]
then 
    echo "ListExamples found"
else 
    echo "Need file ListExamples.java"
    exit 1
fi

cp ../TestListExamples.java student-submission
cp -r ../lib ./
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java

if [[ $? == 0 ]]
then
    echo "Compile Success"
else
    echo "There is a compile error"
    exit 1
fi

cp -r ../lib ./
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > run_error.txt
#RUN=`grep -i "Failed" run_error.txt 2> run_error.txt| wc -l`
#echo $RUN

if [[ $? -ne 0 ]]
then 
    echo "Run Fail: Score 0"
    exit 1
else
    echo "Run Success: Score 100"
fi






