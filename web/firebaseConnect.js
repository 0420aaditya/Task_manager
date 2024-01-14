// Import the functions you need from the SDKs you need
import { initializeApp } from 'firebase/app';
import { getAnalytics } from 'firebase/analytics';
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyB3WcXlVoesdWbqqTqqepwlQGyOFdJrQO8",
  authDomain: "task-manager-3e5ea.firebaseapp.com",
  projectId: "task-manager-3e5ea",
  storageBucket: "task-manager-3e5ea.appspot.com",
  messagingSenderId: "953166878169",
  appId: "1:953166878169:web:4e9ab58574df61c24cf5c8",
  measurementId: "G-DJHL90YMEB"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
 
