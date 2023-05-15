# Deployment Script

This script allows for the deployment of a frontend application and an API, with options to deploy on Nginx or Apache server and obtain SSL certificates using Certbot.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Smx27/AutoDeploy
   ```

2. Navigate to the script directory:

   ```bash
   cd AutoDeploy
   ```

3. Make the script executable:

   ```bash
   sudo chmod +x main.sh
   ```

4. Install the required dependencies. For example, angular or if using Node.js for the frontend and dotnet for the API (Cause all are version specific):

   - Node.js: Install Node.js by following the official installation guide: [Node.js Installation](https://nodejs.org/en/download/)
   	- For linux:
   ```bash
   sudo apt-get install nodejs
   ```
   - dotnet: Install dotnet by following the official installation guide: [dotnet Installation](https://dotnet.microsoft.com/download)
   
   Note: Make sure the necessary build tools are installed for building the frontend and API.

5. Install Certbot if you plan to obtain SSL certificates:

   - For Ubuntu:

     ```bash
     sudo apt-get update
     sudo apt-get install certbot
     ```
   - But one thing to note this installation is also automated in script XD.
   - For other systems, refer to the official Certbot documentation: [Certbot Installation](https://certbot.eff.org/docs/install.html)

## Usage

1. Modify the script variables to match your environment in the `main.sh` file:

   - `FRONTEND_PATH`: Path to the frontend deployment directory.
   - `API_PATH`: Path to the API deployment directory.
   - `BACKUP_PATH`: Path to the backup directory.
   - `LOG_FILE`: Path to the log file.

2. Customize the Nginx and Apache configuration files (`nginx.conf` and `apache.conf`) according to your project requirements.

3. Make all script executable:
```bash
	sudo chmod +x ./subscripts/make_executable.sh
```
3. Run the deployment script:

   ```bash
   ./main.sh
   ```

4. Follow the prompts and choose the desired deployment options:

   - Deploy Frontend: Builds and deploys the frontend application.
   - Deploy API: Builds and deploys the API.
   - Quit: Exits the script.

5. If deploying on Nginx or Apache, ensure that the server is properly configured with the appropriate virtual host settings.

6. If you want to revert the changes made by the script, run the script again and choose the option to revert changes.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- [Certbot](https://certbot.eff.org/): For providing SSL certificate automation.
- [Nginx](https://nginx.org/): For the Nginx web server.
- [Apache](https://httpd.apache.org/): For the Apache web server.

## Troubleshooting and FAQ

**Q: I'm getting an error when running the script. What should I do?**

A: Make sure you have all the required dependencies installed and the necessary permissions to execute the script. Check the script's log file for more information.

**Q: How can I customize the Nginx or Apache configuration?**

A: Open the respective configuration file (`nginx.conf` or `apache.conf`) and modify the settings according to your project's requirements. Refer to the Nginx or Apache documentation for more information on configuration options.

## Contact Information

For any questions or support, please contact [Smx27](mailto:maiti.sumit2001@gmail.com).

## Development plan 
This script is mainly focus to deploy dotnet api and angular frontend but in feature I have plan to upgrade it to deploy:
- ReactJs app
- VeuJs app
- Dotnet MVC app
- PHP app
- Or basic my SQl deployment 
Feel free to [contribute](https://github.com/Smx27/AutoDeploy) to this thanks 🙂
