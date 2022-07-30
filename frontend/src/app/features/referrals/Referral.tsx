import React from 'react';
import { Grid, Card, Typography } from '@mui/material';

const Referral = (props: any) => {
  return (
    <Card style={{ maxWidth: 450, padding: "10px 5px", margin: "5px auto" }}>
      <Typography gutterBottom >
        {props.user_email}
      </Typography>
      <Typography gutterBottom>
        {props.user_name}
      </Typography>
    </Card>
  );
};

export default Referral;