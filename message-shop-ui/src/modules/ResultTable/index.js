import { Link, useLocation } from 'react-router-dom'

const ResultTable = () => {
    const location = useLocation();
    const data = location.state;

    return (
      <div>
        <div className="ButtonLink BackButton"><Link to="/">Back</Link></div>
            <div className="textContent">
                <h3>Here is your result!</h3>

                <div className="ResultTable">
                    {data.tableData && data.tableData.length > 0 &&
                        <table>
                            <thead>
                                <tr>
                                    {
                                        Object.keys(data.tableData[0]).map(key => 
                                            <td key={key}>{ key }</td>
                                        )
                                    }
                                </tr>
                            </thead>
                            <tbody>
                                {
                                    data.tableData.map((line, index) =>
                                        <tr key={index}>
                                            {
                                                Object.keys(line).map(key => 
                                                    <td key={key}>{ line[key] }</td>
                                                )
                                            }
                                        </tr>
                                    )
                                }
                            </tbody>
                        </table>
                    }
                </div>
            </div>
      </div>
    )
}

export default ResultTable