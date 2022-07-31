import React, { useState } from 'react';
import { useSelector } from "react-redux"
import { RootState } from "../../store"
import { Button } from "@mui/material";
import styles from './Dashboard.module.css';
import { Grid, Card, Typography } from '@mui/material';
import ReferralForm from '../referrals/ReferralForm';
import ReferralList from '../referrals/ReferralList';

function Dashboard() {
  const currentUser = useSelector((state: RootState) => state.session.currentUser)
  const accessToken = useSelector((state: RootState) => state.session.accessToken)
  const refreshToken = useSelector((state: RootState) => state.session.refreshToken)
  const [referrals, setReferrals] = useState(currentUser?.referrals);
  const onUpdateList = (props: any) => {
    setReferrals((previousState: any) => {
        return [props, ...previousState]
    });
  }
  return (
    <Grid>
      <Card style={{ maxWidth: 450, padding: "20px 5px", margin: "20px auto" }}>
        <ReferralForm onUpdateList={onUpdateList}/>
        <Card style={{ maxWidth: 450, padding: "20px 5px", margin: "5% auto" }}>
          <ReferralList referrals={referrals} />
        </Card>
      </Card>
    </Grid>
  )
}

export default Dashboard