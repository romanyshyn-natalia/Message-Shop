import { Link } from 'react-router-dom'

const AuthorRole = () => {

  return (
      <div>
        <div className="ButtonLink BackButton"><Link to="/">Back</Link></div>
            <div className="textContent">
                <h3>Now choose the request for role "author"</h3>
                <div className="ButtonContainer ButtonRoleContainer">
                    <div className="ButtonLink ButtonRoleLink"><Link to="/author-role/1">find all customers who ordered certain author messages at least N times during the specified period (from date F to date T)</Link></div>
                    <div className="ButtonLink ButtonRoleLink"><Link to="/author-role/2">find all authors who have received orders from at least N different customers during the specified period (from date F to date T)</Link></div>
                    <div className="ButtonLink ButtonRoleLink"><Link to="/author-role/3">find all accounbts in social networks to which certain author had access during the specified period (from date F to date T)</Link></div>
                    <div className="ButtonLink ButtonRoleLink"><Link to="/author-role/4">find all common events for author A and customer C during the specified period (from date F to date T)</Link></div>
                    <div className="ButtonLink ButtonRoleLink"><Link to="/author-role/5">for author A and each social network in which he wrote the article, find how many times during specified period (from date F to date T) he wrote it in a group of at least N authors</Link></div>
                    <div className="ButtonLink ButtonRoleLink"><Link to="/author-role/6">find the total number of orders by month</Link></div>
                </div>
            </div>
      </div>
  )
}

export default AuthorRole