import { Link } from 'react-router-dom'

const StartPage = () => {

  return (
      <div className="textContent">
          <h1>Hi! Welcome to message shop!</h1>
          <h3>Here you have an opportunity to perform certain reqests on message_shop database.</h3>
          <p className="MainButton"><Link to="/select-role">Try it now</Link></p>
      </div>
  )
}

export default StartPage