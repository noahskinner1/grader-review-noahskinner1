CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

WD=$(pwd)

git clone $1 student-submission
echo 'Finished cloning'

if  ! find "$WD/student-submission" -type f -name "ListExamples.java" | grep -q "ListExamples.java" ; then
    echo 'Incorrect file provided, please resubmit'
    exit
fi
echo 'File found!'

cp "$WD/student-submission/ListExamples.java" "$WD/grading-area"
cp "$WD/TestListExamples.java" "$WD/grading-area"
cp -r "$WD/lib" "$WD/grading-area"

javac "$CPATH *.java"
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
