import { Link } from 'react-router-dom'

const SelectRole = () => {

  return (
      <div>
        <div className="ButtonLink BackButton"><Link to="/">Back</Link></div>
            <div className="textContent">
                <h3>Choose one of the roles you want to perform request on.</h3>
                <div className="ButtonContainer">
                    <div className="ButtonLink"><Link to="/author-role">Author</Link></div>
                    <div className="ButtonLink"><Link to="/customer-role">Customer</Link></div>
                    <div className="ButtonLink"><Link to="/social-media-role">Social media</Link></div>
                </div>
            </div>
      </div>
  )
}

export default SelectRole
