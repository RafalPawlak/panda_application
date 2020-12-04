pipeline {
    agent {
       label 'dockerslave'
    }

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "auto_maven"
    }
    
    environment{
        IMAGE = readMavenPom().getArtifactId()
        VERSION = readMavenPom().getVersion()
    }

    stages {
        
         stage('Clear running apps') {
            steps {
                sh 'docker rm -f pandaapp || true'
            }
        }
        
        stage('Pull') {
            steps {
                // Get some code from a GitHub repository
                checkout scm
            }
        }
        stage('Build'){
               steps{
                // Run Maven on a Unix agent.
                sh 'mvn clean install'
            }

        }
        
                 stage('Build docker image'){
               steps{
                // Run Maven on a Unix agent.
                sh 'mvn package -Pdocker'
            }
           
        }
        
                 stage('Run docker app'){
               steps{
                // Run Maven on a Unix agent.
                sh 'docker run -d -p 0.0.0.0:8080:8080 --name pandaapp -t ${IMAGE}:${VERSION}'
            }
           
        }
                stage('Test selenium'){
               steps{
                // Run Maven on a Unix agent.
                sh 'mvn test -Pselenium'
            }
           
        }
        
       
           stage('Deploy'){
               steps{
        configFileProvider([configFile(fileId: '6944429f-4914-4c29-ae1f-cf032e9f0bf6', variable: 'MAVEN_SETTINGS')]) {
           sh 'mvn -s $MAVEN_SETTINGS deploy -Dmaven.test.skip=true -e'
            }
        }
  
             post{
     always  {
         sh 'docker stop pandaapp'
         deleteDir()
        }
     }
     
    }
 }

}
