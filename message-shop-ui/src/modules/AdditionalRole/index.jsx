import { Link, useHistory } from 'react-router-dom'

const SocialMediaRole = () => {
    let history = useHistory();

    const handleSubmit = async (evt) => {
        evt.preventDefault();
        
        const resp = await fetch(`http://127.0.0.1:5000/additional`)
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
                <div className="ButtonContainer ButtonRoleContainer">
                    <div className="ButtonLink ButtonRoleLink" onClick={handleSubmit}>Get discounts</div>
                </div>
            </div>
      </div>
  )
}

export default SocialMediaRole