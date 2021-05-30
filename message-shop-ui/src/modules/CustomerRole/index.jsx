import { Link } from 'react-router-dom'

const CustomerRole = () => {

  return (
      <div>
        <div className="ButtonLink BackButton"><Link to="/">Back</Link></div>
            <div className="textContent">
                <h3>Now choose the request for role "customer"</h3>
                <div className="ButtonContainer ButtonRoleContainer">
                    <div className="ButtonLink ButtonRoleLink"><Link to="/customer-role/1">for customer C find all authors who he ordered a message or article during the specified period (from date F to date T)</Link></div>
                    <div className="ButtonLink ButtonRoleLink"><Link to="/customer-role/2">find all customers who have made at least N orders during the specified period (from date F to date T)</Link></div>
                    <div className="ButtonLink ButtonRoleLink"><Link to="/customer-role/3">for customer C find all social networks for which he made at least N orders during the specified period (from date F to date T)</Link></div>
                    <div className="ButtonLink ButtonRoleLink"><Link to="/customer-role/4">for customer C find all authors whom he gave access to at least one account in the social network, and then took this access away</Link></div>
                    <div className="ButtonLink ButtonRoleLink"><Link to="/customer-role/5">find all common events for author A and buyer C during the specified period (from date F to date T)</Link></div>
                    <div className="ButtonLink ButtonRoleLink"><Link to="/customer-role/6">for customer C and each style in which he ordered the message, find how many orders during the specified period (from date F to date T) received a 50% discount)</Link></div>
                </div>
            </div>
      </div>
  )
}

export default CustomerRole