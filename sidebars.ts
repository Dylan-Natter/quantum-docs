import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

const sidebars: SidebarsConfig = {
  // Main documentation sidebar
  docsSidebar: [
    'overview',
    {
      type: 'category',
      label: 'Architecture',
      items: [
        'architecture/overview',
        'architecture/tutorial',
      ],
    },
    {
      type: 'category',
      label: 'Blueprints',
      items: [
        'blueprints/application-blueprint',
        'blueprints/design-system',
      ],
    },
    {
      type: 'category',
      label: 'Getting Started',
      items: [
        'getting-started/quick-start',
      ],
    },
    {
      type: 'category',
      label: 'Development',
      items: [
        'development/github-setup-guide',
        'development/remote-repository-setup',
        'development/git-workflow',
      ],
    },
    {
      type: 'category',
      label: 'Blueprint & Planning',
      items: [
        'blueprint/context',
        'blueprint/build_steps',
        'blueprint/decision_records/ADR-0000-template',
      ],
    },
    {
      type: 'category',
      label: 'Code Snippets',
      items: [
        'snippets/architect_preamble',
      ],
    },
  ],

  // API Reference sidebar
  apiSidebar: [
    'api-reference/overview',
  ],

  // Guides sidebar
  guidesSidebar: [
    'getting-started/quick-start',
  ],
};

export default sidebars;