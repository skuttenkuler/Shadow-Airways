import React from 'react';
import { StyleSheet, Text,
         View,
         Button, Dimensions
} from 'react-native';

import BookTicket from './BookTicket';
//import EuroScreen from './EuroScreen';

const { width: WIDTH } = Dimensions.get('window')

export default function HomeScreen({navigation}) {
    return (
      <>
       <Button style={styles.domesticBtn}
            title="Domestic"
            color='#007AFF'
            onPress={() => navigation.navigate('Book Ticket', {screen: BookTicket})}>
       </Button>
      </>

    );
  }


const styles = StyleSheet.create({
  headerText: {
    color: 'white',
    fontSize: 60,
    fontWeight: '500',
    height: 225,
    opacity: 0.9,
  },
  domesticBtn: {
    color: '#007AFF',
    width: WIDTH - 25,
    height: 60,
    borderRadius: 25,
    justifyContent: 'center',
    opacity: 0.7,
    marginTop: -100
  },
  btnText: {
    color: 'white',
    textAlign: 'center',
    fontSize: 30
  },
});