pipeline {
  agent { node 'master' }
  stages {
    stage('Build') {
      steps {
        script {
          sh 'bundle install'
          if (env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'sauce_prod' || env.BRANCH_NAME == 'integration') {
            withCredentials([usernamePassword(credentialsId: 'sauce-prod-key', passwordVariable: 'SAUCE_ACCESS_KEY', usernameVariable: 'SAUCE_USERNAME')]) {
              sh 'PROCESSES=1 SAUCE_URL=http://ondemand.saucelabs.com/wd/hub PLATFORM_FILE=prod bundle exec rake -j3 sauce_demo'
            }
          } else {
            withCredentials([usernamePassword(credentialsId: 'sam-headless-creds', passwordVariable: 'SAUCE_ACCESS_KEY', usernameVariable: 'SAUCE_USERNAME')]) {
              sh 'PROCESSES=8 SAUCE_URL=http://ondemand.us-east-1.saucelabs.com/wd/hub SAUCE_DATA_CENTER=US_EAST PLATFORM_FILE=headless bundle exec rake -j25 sauce_demo'
            }
          }
        }
      }
    }
  }
}