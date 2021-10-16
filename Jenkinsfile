pipeline {
    agent {
        label  'stage'
    }
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh './gradlew build --no-daemon'
                archiveArtifacts artifacts: 'dist/trainSchedule.zip'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew npm_test'
                }
            post {
                always {
                    step([$class: 'CoberturaPublisher', coberturaReportFile: 'output/coverage/jest/cobertura-coverage.xml'])
                }
            }
        }
        stage('Deploy') {
            steps {
                sh './scripts/start.sh '
                input 'ready to terminate'
                sh '''
                  kill -9 `cat .pidfile`
                '''
            }
        }
    }
    post {
            always {
                    emailext (
                    to: 'test@gmail.com',
                    subject: "${env.JOB_NAME} #${env.BUILD_NUMBER} [${currentBuild.result}]",
                    body: "Build URL: ${env.BUILD_URL}.\n\n",
                    attachLog: true,
                    )
            }
        }
}
