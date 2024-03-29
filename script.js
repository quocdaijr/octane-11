import http from 'k6/http';

export const options = {
    vus: 100,
    duration: '30s',
    ext: {
        loadimpact: {
            // Project: Default project
            projectID: 3688913,
            // Test runs with the same name groups test runs together.
            name: `${__ENV.TYPE} Test Run`,
            distribution: {
                distributionSingapore: {loadZone: 'amazon:sg:singapore', percent: 100},
            },

        }
    }
};

export default function () {
    http.get(`${__ENV.URL}`);
}