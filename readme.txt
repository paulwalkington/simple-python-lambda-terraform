
--------installing dependencies


$ pipenv install
this will create a new virtual environment if one is needed and insatll everything in the pipfile

--------zip up function

run the following script to create a zipped up copy of the lambda with dependencies
$ ./zip-lambda.sh

-----manually upload the lambda function using awscli


---create new role for lambda

$ aws iam create-role --role-name lambda-ex --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'

$ aws iam attach-role-policy --role-name lambda-ex --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

---creating the function in AWS

--create new lambda function

$ aws lambda create-function --function-name paul-function \
--zip-file fileb://function.zip --handler simple-lambda.lambda_handler --runtime python3.8 \
--role arn:aws:iam::455073406672:role/lambda-ex

--update lambda function

$ aws lambda update-function-code --function-name paul-function --zip-file fileb://function.zip




-------notes

using pipenv from scratch 

creates local virtual environment in: /Users/paul/.local/share/virtualenvs
e.g.
/Users/paul/.local/share/virtualenvs/simple-python-lambda-terraform-lhuFAxeM

$ pipenv shell

install a dependencies
$ pipenv install requests

all the details are stored in Pipfile.
to install all the dependencies run the following:
$ pipenv install 

this will create a new virtual environment if one is needed and insatll everything in the pipfile

https://realpython.com/python-virtual-environments-a-primer/
https://stackoverflow.com/questions/41427500/creating-a-virtualenv-with-preinstalled-packages-as-in-requirements-txt
https://python-docs.readthedocs.io/en/latest/dev/virtualenvs.html