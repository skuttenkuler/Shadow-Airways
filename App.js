import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import Home from './Screens/Home'
import BookTicket from './Screens/BookTicket'
import Ticket from './Screens/Ticket'

const Stack = createStackNavigator();

function MyStack() {
  return (
    <Stack.Navigator
        screenOptions={{
          headerTitleAlign: 'center',
          headerStyle: {
            backgroundColor: '#621FF7',
          },
          headerTintColor: '#fff',
          headerTitleStyle :{
            fontWeight: 'bold',
          },
        }}
      >
      <Stack.Screen 
        name="Home" 
        component={Home} 
        options={{ title: 'Home' }}
      />
      <Stack.Screen 
        name="Book Ticket" 
        component={BookTicket} 
        options={{ title: 'BookTicket' }}
      />
      <Stack.Screen 
       name="Ticket" 
       component={Ticket} 
       options={{ title: 'Ticket' }}
      />
    </Stack.Navigator>
  );
}
export default function App(){
  return (
    <NavigationContainer>
      <MyStack />
    </NavigationContainer>
  )
}