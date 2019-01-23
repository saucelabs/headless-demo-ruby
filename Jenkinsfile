pipeline {
  stages {
    stage('Build') {
      steps {
        script {
          if (env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'sauce_prod') {
            withCredentials([usernamePassword(credentialsId: 'sauce-prod-key', passwordVariable: 'SAUCE_KEY', usernameVariable: 'SAUCE_USERNAME')]) {
              sh 'PROCESSES=1 bundle exec rake -j4 sauce_demo'
            }
          } else {
            withCredentials([usernamePassword(credentialsId: 'sauce-headless-key', passwordVariable: 'SAUCE_KEY', usernameVariable: 'SAUCE_USERNAME')]) {
              sh 'PROCESSES=8 bundle exec rake -j12 sauce_demo'
            }
          }
        }
      }
    }
  }
}