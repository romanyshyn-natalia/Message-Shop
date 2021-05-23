import { Link, useHistory } from 'react-router-dom'

const SocialMediaRoleRequest1 = () => {
    let history = useHistory();

    const handleSubmit = (evt) => {
        evt.preventDefault();
        history.push({
            pathname: '/result',
            state: {
              tableData: [
                  {
                    'title1': 'aa1',
                    'title2': 'bb1',
                  },
                  {
                    'title1': 'aa2',
                    'title2': 'bb2',
                  },
              ],
            },
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
                            <span>Month:</span>
                            <input type="text"/>
                        </div>
                    </form>
                </div>
                <div className="SubmitButton" onClick={handleSubmit}>Submit</div>
            </div>
      </div>
    )
}

export default SocialMediaRoleRequest1