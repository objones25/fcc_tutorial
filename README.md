# Friends Management App

A modern Ruby on Rails web application for managing personal contacts and connections. Built following the Free Code Camp Ruby on Rails tutorial with additional enhancements and styling.

![Ruby on Rails](https://img.shields.io/badge/Ruby%20on%20Rails-7.0-red)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.0-blue)
![SQLite](https://img.shields.io/badge/SQLite-3.0-lightgrey)

## 🌟 Features

- **User Authentication**: Secure user registration and login with Devise
- **Personal Friend Lists**: Each user manages their own private contact list
- **Smart Search**: Real-time search functionality across names, emails, phone numbers, and social media handles
- **CRUD Operations**: Create, read, update, and delete friend records
- **Contact Validation**: Email format validation and phone number formatting
- **Responsive Design**: Mobile-friendly interface using Bootstrap 5
- **Modern UI**: Clean, professional interface with Bootstrap Icons

## 🚀 Live Demo

Visit the application at: [Your deployment URL here]

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Ruby**: 3.0 or higher
- **Rails**: 7.0 or higher
- **SQLite3**: For database
- **Git**: For version control
- **Node.js**: For asset compilation (if using Webpacker)

## 🛠️ Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/objones25/fcc_tutorial.git
   cd friends-management-app
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # Optional: if you have seed data
   ```

4. **Start the development server**
   ```bash
   rails server
   ```

5. **Visit the application**
   Open your browser and navigate to `http://localhost:3000`

## 🏗️ Project Structure

```
app/
├── controllers/
│   ├── application_controller.rb
│   ├── friends_controller.rb
│   └── home_controller.rb
├── models/
│   ├── friend.rb
│   └── user.rb
├── views/
│   ├── friends/
│   ├── home/
│   ├── layouts/
│   └── devise/
└── assets/
    └── stylesheets/
```

## 💾 Database Schema

### Users Table
- `id` (Primary Key)
- `email` (String, Unique)
- `encrypted_password` (String)
- `created_at` (DateTime)
- `updated_at` (DateTime)

### Friends Table
- `id` (Primary Key)
- `first_name` (String, Required)
- `last_name` (String, Required)
- `email` (String, Optional)
- `phone` (String, Optional)
- `twitter` (String, Optional)
- `user_id` (Foreign Key)
- `created_at` (DateTime)
- `updated_at` (DateTime)

## 🔧 Configuration

### Environment Variables

For production deployment, you may need to set:

```bash
RAILS_ENV=production
SECRET_KEY_BASE=your_secret_key
DATABASE_URL=your_database_url  # For PostgreSQL in production
```

### Database Configuration

The application uses SQLite for development and testing. For production, consider using PostgreSQL:

```ruby
# config/database.yml
production:
  adapter: postgresql
  database: friends_app_production
  username: <%= ENV['DATABASE_USERNAME'] %>
  password: <%= ENV['DATABASE_PASSWORD'] %>
  host: <%= ENV['DATABASE_HOST'] %>
```

## 🧪 Testing

Run the test suite:

```bash
# Run all tests
rails test

# Run specific test files
rails test test/models/friend_test.rb
rails test test/controllers/friends_controller_test.rb
```

## 📱 Usage

1. **Sign Up**: Create a new account or sign in with existing credentials
2. **Add Friends**: Click "New Friend" to add contacts with their information
3. **Search**: Use the search bar in the navigation to find specific friends
4. **Manage**: Click on friend names to view details, or use the delete button to remove contacts
5. **Profile**: Access your account settings through the user dropdown menu

## 🎨 Customization

### Styling

The application uses Bootstrap 5 for styling. Custom styles can be added to:
- `app/assets/stylesheets/application.css`

### Adding New Fields

To add new fields to the Friend model:

1. Generate a migration:
   ```bash
   rails generate migration AddFieldToFriends field_name:string
   ```

2. Update the model validations in `app/models/friend.rb`

3. Update the controller strong parameters in `app/controllers/friends_controller.rb`

4. Update the form in `app/views/friends/_form.html.erb`

## 🚀 Deployment

### Heroku Deployment

1. **Install Heroku CLI** and login
2. **Create Heroku app**:
   ```bash
   heroku create your-app-name
   ```

3. **Add PostgreSQL addon**:
   ```bash
   heroku addons:create heroku-postgresql:hobby-dev
   ```

4. **Deploy**:
   ```bash
   git push heroku main
   heroku run rails db:migrate
   ```

### Other Deployment Options

- **Railway**: Simple deployment with automatic builds
- **Render**: Modern cloud platform with easy Rails deployment
- **DigitalOcean App Platform**: Managed platform with database options

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📚 Learning Resources

This project is based on the Free Code Camp Ruby on Rails tutorial:

- **Tutorial Video**: [Learn Ruby on Rails - Full Course](https://www.youtube.com/watch?v=fmyvWz5TUWg&t=2975s)
- **Created by**: Codemy.com
- **Platform**: Free Code Camp

### Additional Resources

- [Ruby on Rails Guides](https://guides.rubyonrails.org/)
- [Devise Documentation](https://github.com/heartcombo/devise)
- [Bootstrap Documentation](https://getbootstrap.com/docs/5.0/)

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- **Free Code Camp** - For providing excellent free coding education
- **Codemy.com** - For creating the comprehensive Rails tutorial
- **Ruby on Rails Community** - For maintaining the amazing framework
- **Bootstrap Team** - For the responsive CSS framework
- **Devise Team** - For the authentication solution

## 📞 Support

If you have any questions or run into issues:

1. Check the [Issues](https://github.com/yourusername/friends-management-app/issues) page
2. Create a new issue if your problem isn't already reported
3. Provide detailed information about your environment and the issue

## 🔄 Version History

- **v1.0.0** - Initial release with basic CRUD functionality
- **v1.1.0** - Added search functionality and enhanced UI
- **v1.2.0** - Improved responsive design and validation

---

**Built with ❤️ using Ruby on Rails**
