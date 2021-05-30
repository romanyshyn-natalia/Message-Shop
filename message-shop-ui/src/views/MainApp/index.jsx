import { BrowserRouter as Router, Switch, Route } from 'react-router-dom'
import StartPage from '../../modules/StartPage'
import SelectRole from '../../modules/SelectRole'
import AuthorRole from '../../modules/AuthorRole'
import CustomerRole from '../../modules/CustomerRole'
import SocialMediaRole from '../../modules/SocialMediaRole'
import AdditionalRole from '../../modules/AdditionalRole'

import SocialMediaRoleRequest1 from '../../modules/SocialMediaRole/SocialMediaRoleRequest1'
import AuthorRoleRequest1 from '../../modules/AuthorRole/AuthorRoleRequest1'
import AuthorRoleRequest2 from '../../modules/AuthorRole/AuthorRoleRequest2'
import AuthorRoleRequest3 from '../../modules/AuthorRole/AuthorRoleRequest3'
import AuthorRoleRequest4 from '../../modules/AuthorRole/AuthorRoleRequest4'
import AuthorRoleRequest5 from '../../modules/AuthorRole/AuthorRoleRequest5'
import AuthorRoleRequest6 from '../../modules/AuthorRole/AuthorRoleRequest6'
import CustomerRoleRequest1 from '../../modules/CustomerRole/CustomerRoleRequest1'
import CustomerRoleRequest2 from '../../modules/CustomerRole/CustomerRoleRequest2'
import CustomerRoleRequest3 from '../../modules/CustomerRole/CustomerRoleRequest3'
import CustomerRoleRequest4 from '../../modules/CustomerRole/CustomerRoleRequest4'
import CustomerRoleRequest5 from '../../modules/CustomerRole/CustomerRoleRequest5'
import CustomerRoleRequest6 from '../../modules/CustomerRole/CustomerRoleRequest6'

import ResultTable from '../../modules/ResultTable'

import './styles.css'

const MainApp = () => {

  return (
      <div className="MainContent">
        <Router>
            <Switch>
                <Route path="/result" render={(props) => <ResultTable {...props}/>}/>
                <Route path="/customer-role/1">
                    <CustomerRoleRequest1 />
                </Route>
                <Route path="/customer-role/2">
                    <CustomerRoleRequest2 />
                </Route>
                <Route path="/customer-role/3">
                    <CustomerRoleRequest3 />
                </Route>
                <Route path="/customer-role/4">
                    <CustomerRoleRequest4 />
                </Route>
                <Route path="/customer-role/5">
                    <CustomerRoleRequest5 />
                </Route>
                <Route path="/customer-role/6">
                    <CustomerRoleRequest6 />
                </Route>
                <Route path="/author-role/1">
                    <AuthorRoleRequest1 />
                </Route>
                <Route path="/author-role/2">
                    <AuthorRoleRequest2 />
                </Route>
                <Route path="/author-role/3">
                    <AuthorRoleRequest3 />
                </Route>
                <Route path="/author-role/4">
                    <AuthorRoleRequest4 />
                </Route>
                <Route path="/author-role/5">
                    <AuthorRoleRequest5 />
                </Route>
                <Route path="/author-role/6">
                    <AuthorRoleRequest6 />
                </Route>
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
                <Route path="/additional-role">
                    <AdditionalRole />
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