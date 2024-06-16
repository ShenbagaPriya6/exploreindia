class Slider extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            events: [], // Initialize with empty array
            currentEventIndex: 0
        };
    }

    componentDidMount() {
        // Fetch events from JSON file
        fetch('events.json')
            .then(response => response.json())
            .then(data => {
                this.setState({ events: data });
                // Start interval to change events every 5 seconds
                this.interval = setInterval(this.changeEvent, 2000);
            })
            .catch(error => console.error('Error fetching events:', error));
    }

    componentWillUnmount() {
        // Clear interval when component unmounts
        clearInterval(this.interval);
    }

    changeEvent = () => {
        // Update current event index to display the next event
        this.setState(prevState => ({
            currentEventIndex: (prevState.currentEventIndex + 1) % this.state.events.length
        }));
    }

    render() {
        const { events, currentEventIndex } = this.state;
        return (
            <div id="slider">
                {/* Render current event */}
                <a href={events[currentEventIndex]?.link}>
                    <img src={events[currentEventIndex]?.image} alt={events[currentEventIndex]?.title} />
                    <p>{events[currentEventIndex]?.title}</p>
                </a>
            </div>
        );
    }
}

// Render the Slider component to the #slider-container element
ReactDOM.render(<Slider />, document.getElementById('slider-container'));
