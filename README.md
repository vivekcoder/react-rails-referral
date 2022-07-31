This project enables users to sign up and invite other users to the app.

It consists of two applications, react js frontend and a backend built using Ruby On Rails.

## React app
To run the RoR app, navigate to the backend folder.

### `cd backend`

Install the required ruby version.
### `rvm install 3.0.1`

Bundle install the gems.
### `bundle`

Check database.yml for local database configurations and Create database by running:
### `rake db:create`

Run migrations.
### `rake db:migrate`

Note: To send mails to the referred users, you need to setup the mailing credentials. Do this in the development.rb file.

Finally, run the server on port 3001.
`rails s -p 3001`

## React app
To run the react app, navigate to the frontend folder.
### `cd frontend`
### `npm install`
### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

To install material ui
### `npm install @mui/material @emotion/react @emotion/styled`
### `npm install @material-ui/core`
### `npm install @material-ui/icons`

To install formik
### `npm install formik`

To install yup
### `npm install yup`
