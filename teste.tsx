import React from 'react';

const Teste: React.FC = () => {
	const teste = 'teste';

	useEffect(() => {
		console.log(teste);
		alert(teste);
	}, [teste]);

	return (
		<>
			<h1 className="yes"></h1>
			<p></p>
		</>
	);
};

export default Teste;

