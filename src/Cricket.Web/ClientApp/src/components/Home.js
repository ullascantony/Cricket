import React from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';

const Home = () => (
    <div className="text-left">
        <h1>React JS SPA</h1>
        <h5>This is a single-page application built with Visual Studio React with Redux boilerplate</h5>
        <hr />
        <div className="contents">
            You can expand this application by adding further modules, refer existing code for patterns and practices
            <br /><br />
            <ul>
                <li><b>Client-side navigation</b>: Build with React router DOM</li>
                <li><b>Centralized Redux store</b>: To add and manage multiple Reducers</li>
                <li><b>SQL Server database project</b>: All objects and scripts provided to quickly setup the database</li>
                <li><b>Development server integration</b>: In development mode, the development server from <code>create-react-app</code> runs in the background automatically, so your client-side resources are dynamically built on demand and the page refreshes when you modify any file.</li>
                <li><b>Efficient production builds</b>: In production mode, development-time features are disabled, and your <code>dotnet publish</code> configuration produces minified, efficiently bundled JavaScript files.</li>
            </ul>
            <br />
            The <code>ClientApp</code> subdirectory is a standard React application based on the <code>create-react-app</code> template. If you open a command prompt in that directory, you can run <code>npm</code> commands such as <code>npm test</code> or <code>npm install</code>.
        </div>
        <hr />
        <Link className="btn btn-secondary" name="About" title="Click for more information" to={'/about'}>About</Link>
    </div>
);

export default connect()(Home);
