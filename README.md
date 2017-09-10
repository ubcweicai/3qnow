3qnow README
======

##Database

We have created several MYSQL scripts for different purposes.

<b>bootstrap.sql</b> - creates database and tables

<b>testdata.sql</b> - some test data for development use

<b>bootstrap_without_constrain.sql</b> - creates database and tables, but without constrains. This will be used only in development phase and should NOT be used for production.

<b>createuser.sql</b> - creates database admin user and grants right. It is usually used only once.

<b>droptables.sql</b> - drop tables. It is used for local development and remote testing servers.

##Source Code Formatter

The source code formatter is defined in /docs/code_formatter.xml. Please import the file through your project properties in the Eclipse, like Properties->Java Code Style->Formatter->Import. 

When you modify or/and create any Java files, please make sure you do Ctrl+Shift+F to format the file before commiting the changes.

If you are not happy with the pre-defined format, you could edit the format in Eclipse and export to /docs/code_formatter.xml. And let all the team members know along with your reasonings of the changes.

##Deployment

The master branch is deployed to: <br/>
Admin: http://54.149.114.253/admin/ or http://dev.3qnow.net/admin/ <br />
Web: http://54.149.114.253/web/ or http://dev.3qnow.net/web/ <br />


