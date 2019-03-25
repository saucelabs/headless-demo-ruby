pipeline {
  agent { node 'master' }
  stages {
    stage('Build') {
      steps {
        script {
          if (env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'sauce_prod' || env.BRANCH_NAME == 'integration') {
            withCredentials([usernamePassword(credentialsId: 'sauce-prod-key', passwordVariable: 'SAUCE_KEY', usernameVariable: 'SAUCE_USERNAME')]) {
              sh 'PROCESSES=1 SAUCE_URL=http://ondemand.saucelabs.com/wd/hub PLATFORM_FILE=prod bundle exec rake -j3 sauce_demo'
            }
          } else {
            withCredentials([usernamePassword(credentialsId: 'sauce-headless-key', passwordVariable: 'SAUCE_KEY', usernameVariable: 'SAUCE_USERNAME')]) {
              sh 'PROCESSES=8 SAUCE_URL=https://us-east1.headless.saucelabs.com/wd/hub PLATFORM_FILE=headless bundle exec rake -j25 sauce_demo'
            }
          }
        }
      }
    }
  }
}