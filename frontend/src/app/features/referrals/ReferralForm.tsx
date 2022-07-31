import { useSelector } from "react-redux"
import { Grid, TextField, Button, Card, CardContent, Typography } from '@mui/material';
import React, { useRef } from 'react';
import axios from "../../api/axios";
import { RootState } from "../../store"

const REFERRAL_CREATE_URL = "api/v1/referrals"

async function addReferralHandler(referral: any) {
  return axios
    .post(REFERRAL_CREATE_URL, referral)
    .then((response: any) => {
      return response.data;
    })
    .catch((error: any) => {
      return error.response.data;
    });
}

function ReferralForm(props: any) {
  const currentUser = useSelector((state: RootState) => state.session.currentUser)
  const nameRef = useRef<any>();
  const emailRef = useRef<any>();
  const messageRef = useRef<any>();
  const accessToken = useSelector((state: RootState) => state.session.accessToken);

  function submitHandler(event: any) {
    event.preventDefault();

    const referral = {
      user_name: nameRef.current.value,
      user_email: emailRef.current.value,
      email_body: messageRef.current.value,
      token: accessToken,
      email: currentUser?.email
    };

    addReferralHandler(referral);
    props.onUpdateList(referral);
    nameRef.current.value = '';
    emailRef.current.value = '';
    messageRef.current.value = '';
  }

  return(
    <Grid>
      <Card style={{ maxWidth: 450, padding: "20px 5px", margin: "0" }}>
        <CardContent>
          <Typography align="center" variant="h5" color="textSecondary" component="p" gutterBottom>
            Liked our program?
            <br/>
            Refer your friends.
          </Typography>
          <form onSubmit={submitHandler}>
            <Grid container spacing={1}>
              <Grid item xs={12}>
                <TextField type="email" placeholder="Enter email" label="Email" variant="outlined" fullWidth required inputRef={emailRef}/>
                <Typography variant="body2" color="textSecondary" component="p" gutterBottom>
                  Invite will be sent on this email.
                </Typography>
              </Grid>
              <Grid item xs={12}>
                <TextField placeholder="Enter name" label="Name" variant="outlined" fullWidth required inputRef={nameRef} />
              </Grid>
              <Grid item xs={12}>
                <TextField label="Message" multiline rows={4} placeholder="Type your message here" variant="outlined" fullWidth required inputRef={messageRef} />
              </Grid>
              <Grid item xs={12}>
                <Button type="submit" variant="contained" color="primary" fullWidth>Refer</Button>
              </Grid>

            </Grid>
          </form>
        </CardContent>
      </Card>
    </Grid>
    )
}

export default ReferralForm;