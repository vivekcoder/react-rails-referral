import React from 'react';
import { Grid, TableRow, TableCell } from '@mui/material';

const Referral = (props: any) => {
  return (
    <TableRow style={{ maxWidth: 450, padding: "10px 5px", margin: "5px auto" }}>
      <TableCell> {props.user_name} </TableCell>
      <TableCell> {props.user_email} </TableCell>
    </TableRow>
  );
};

export default Referral;