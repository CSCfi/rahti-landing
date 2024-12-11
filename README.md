# Rahti Landing Page
A repository for Rahti Service Landing Page

## Address
<a href="https://rahti.csc.fi/" target="_blank">https://rahti.csc.fi</a>

### Editing the landing page

Changes can be made directly to the [html template](/src/html/index.html.j2).

The following variables are pre-defined in [index_content.yaml](/src/html/index_content.yaml), and can be modified if needed.

| Variable                       | Description                                   |
|--------------------------------|-----------------------------------------------|
| SITE_TITLE                     | The title and text to be shown on top.        |
| CLUSTERS.[*]                   | List of the clusters to be listed.            |
| CLUSTERS.[*].ENV_VERSION       | Openshift / Kubernetes version.               |
| CLUSTERS.[*].LOGIN_URL_OIDCIDP | URL to login console of Rahti.                |
| CLUSTERS.[*].SERVICE_DOCS_URL  | URL to documents.                             |
| HEADER_BANNER                  | If set, a banner will be appear in the header.|
| LANDING_PAGE_ANNOUNCEMENTS     | The content will be shwon in the announcement secton. |


### Development
#### Local
For development, one docker-compose file is provided to generate the static pages and serve them at [https://localhost](https://localhost).

```bash
docker compose up -d
```

To see any changes made to the **content**, you can use the `reload.sh` script.

```bash
./reload.sh
```

#### Hosted on Rahti (The standalone for `dev` branch only)

To see the changes during the development, you may merge your branch with `dev` branch. This will automatically trigger a build in Rahti at [https://rahti-landing-dev.rahtiapp.fi](https://rahti-landing-dev.rahtiapp.fi).


### Deployment

Please refer to the internal documentaions for production depolyments.
