
import { selectLocation } from "../components/actions";
const initialState = {

  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case "SWITCH_LOCATIONS":
      return {
        city: action.city,
          jobs: action.jobs
      };
      
      default:
        return state;
  }



};

export default reducer;
