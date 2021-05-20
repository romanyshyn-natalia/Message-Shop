import { BrowserRouter as Router, Switch, Route } from 'react-router-dom'
import StartPage from '../../modules/StartPage'
import SelectRole from '../../modules/SelectRole'
import AuthorRole from '../../modules/AuthorRole'
import CustomerRole from '../../modules/CustomerRole'
import SocialMediaRole from '../../modules/SocialMediaRole'
import SocialMediaRoleRequest1 from '../../modules/SocialMediaRole/SocialMediaRoleRequest1'
import './styles.css'

const MainApp = () => {

  return (
      <div className="MainContent">
        <Router>
            <Switch>
                <Route path="/social-media-role/1">
                    <SocialMediaRoleRequest1 />
                </Route>
                <Route path="/social-media-role">
                    <SocialMediaRole />
                </Route>
                <Route path="/customer-role">
                    <CustomerRole />
                </Route>
                <Route path="/author-role">
                    <AuthorRole />
                </Route>
                <Route path="/select-role">
                    <SelectRole />
                </Route>
                <Route path="/">
                    <StartPage />
                </Route>
            </Switch>
        </Router>
      </div>
  )
}

export default MainApp