import { Link, useHistory } from 'react-router-dom'
import { useState } from 'react'


const SocialMediaRoleRequest1 = () => {
    let history = useHistory();

    const [customer, setcustomer] = useState();
    const [start, setstart] = useState();
    const [end, setend] = useState();

    const handleSubmit = async (evt) => {
        evt.preventDefault();
        
        const resp = await fetch(`http://127.0.0.1:5000/customer-role/6?customer=${customer}&start=${start}&end=${end}`)
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
                    <form>
                        <div className="FormRow">
                            <span>Customer:</span>
                            <input type="text" onChange={e => setcustomer(e.target.value)}/>
                        </div>
                        <div className="FormRow">
                            <span>Start date:</span>
                            <input type="text" onChange={e => setstart(e.target.value)}/>
                        </div>
                        <div className="FormRow">
                            <span>End date:</span>
                            <input type="text" onChange={e => setend(e.target.value)}/>
                        </div>
                    </form>
                </div>
                <div className="SubmitButton" onClick={handleSubmit}>Submit</div>
            </div>
      </div>
    )
}

export default SocialMediaRoleRequest1