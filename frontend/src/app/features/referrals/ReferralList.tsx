import React from 'react';
import { Grid, Card, Typography } from '@mui/material';

import Referral from './Referral';

const ReferralList = (props: any) => {
  return (
    <React.Fragment>
      <Typography gutterBottom variant="h5" align="center">
        Your referrals
      </Typography>
      {props.referrals.map((referral: any) => (
        <Referral
          key={referral.id}
          user_email={referral.user_email}
          user_name={referral.user_name}
        />
      ))}
    </React.Fragment>
  );
};

export default ReferralList;