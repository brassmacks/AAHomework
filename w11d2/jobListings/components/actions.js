import React from 'react'

export const selectLocation = (city, jobs) => {
  let act = {
    type: "SWITCH_LOCATIONS",
    city,
    jobs
  }
  return act;
};

