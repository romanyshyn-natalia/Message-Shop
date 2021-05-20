import { Link } from 'react-router-dom'

const SocialMediaRoleRequest1 = () => {

  return (
      <div>
        <div className="ButtonLink BackButton"><Link to="/">Back</Link></div>
            <div className="textContent">
                <h3>Now fill all required fields.</h3>
                <div className="FormContainer">
                    <form>
                        <div className="FormRow">
                            <span>Author:</span>
                            <input type="text"/>
                        </div>
                        <div className="FormRow">
                            <span>Start date:</span>
                            <input type="text"/>
                        </div>
                        <div className="FormRow">
                            <span>End date:</span>
                            <input type="text"/>
                        </div>
                    </form>
                </div>
                <div className="SubmitButton">Submit</div>
            </div>
      </div>
  )
}

export default SocialMediaRoleRequest1