// Define the URL endpoint to send the request to
function postData() {
const url = 'https://djsevy.com/register_package';

// Create an object with the data to send in the request body
const data = {
  pacakge_id: '1234',
  center_id: '567',
  timestamp: 0
};

// Configure the request
const options = {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify(data),
};

// Send the POST request
fetch(url, options)
  .then(response => response.json())
  .then(data => {
    // Handle the response data
    console.log('Response:', data);
  })
  .catch(error => {
    // Handle any errors that occur during the request
    console.error('Error:', error);
  });
}
