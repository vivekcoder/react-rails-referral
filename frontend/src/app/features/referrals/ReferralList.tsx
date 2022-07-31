import React from 'react';
import { Grid, Card, Typography, TableContainer, Paper, Table, TableHead, TableBody, TableRow, TableCell } from '@mui/material';

import Referral from './Referral';

const ReferralList = (props: any) => {
  return (
    <React.Fragment>
      <Typography gutterBottom variant="h5" align="center">
        Your referrals
      </Typography>
      <TableContainer component={Paper}>
        <Table sx={{ minWidth: 650 }} aria-label="simple table">
          <TableHead>
            <TableRow>
              <TableCell>Name</TableCell>
              <TableCell>Email</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {props.referrals.map((referral: any) => (
              <Referral
                key={referral.id}
                user_email={referral.user_email}
                user_name={referral.user_name}
              />
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </React.Fragment>
  );
};

export default ReferralList;