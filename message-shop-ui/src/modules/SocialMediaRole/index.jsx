import { Link } from 'react-router-dom'

const SocialMediaRole = () => {

  return (
      <div>
        <div className="ButtonLink BackButton"><Link to="/">Back</Link></div>
            <div className="textContent">
                <h3>Now choose the request for role "social network"</h3>
                <div className="ButtonContainer ButtonRoleContainer">
                    <div className="ButtonLink ButtonRoleLink"><Link to="/social-media-role/1">display social networks in descending order of the average number of messages for all styles written by the author A during the specified period (from date F to date T)</Link></div>
                </div>
            </div>
      </div>
  )
}

export default SocialMediaRole