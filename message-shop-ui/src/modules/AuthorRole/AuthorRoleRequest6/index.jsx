import { Link, useHistory } from 'react-router-dom'
import { useState } from 'react'

const SocialMediaRoleRequest1 = () => {
    let history = useHistory();

    const [month, setmonth] = useState();

    const handleSubmit = async (evt) => {
        evt.preventDefault();
        
        const resp = await fetch(`http://127.0.0.1:5000/author-role/6?month=${month}`)
        let data = await resp.json()
        history.push({
            pathname: '/result',
            state: data,
          });
    }
    return (
      <div>
        <div className="ButtonLink BackButton"><Link to="/">Back</Link></div>
            <div className="textContent">
                <h3>Now fill all required fields.</h3>
                <div className="FormContainer">
                </div>
                <div className="SubmitButton" onClick={handleSubmit}>Submit</div>
            </div>
      </div>
    )
}

export default SocialMediaRoleRequest1