pipeline {
	agent any 	
	stages {
		
		stage('git') {
    
			steps {
				git credentialsId: 'git_credentials', url:'https://github.com/sindhukampli/java-example.git'
			}
		}
		stage('build') {
			steps {
				sh "mvn clean install"
			}
		}
	}
}
