@routing @bicycle @safety
Feature: Bicycle - Adds penalties to unsafe roads

    Background:
        Given the profile file
        """
        require 'bicycle'
        properties.weight_name = 'cyclability'
        """

    Scenario: Bike - Apply penalties to ways without cycleways
        Then routability should be
            | highway       | cycleway | forw       | backw      | forw_rate | backw_rate |
            | motorway      |          |            |            |           |            |
            | primary       |          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | secondary     |          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | tertiary      |          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | primary_link  |          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | secondary_link|          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | tertiary_link |          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | residential   |          | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | cycleway      |          | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | footway       |          | 6 km/h +-1 | 6 km/h +-1 | 1.7       | 1.7        |

    Scenario: Bike - Apply no penalties to ways with cycleways
        Then routability should be
            | highway       | cycleway | forw    | backw   | forw_rate | backw_rate |
            | motorway      | yes      |         |         | 4.2       | 4.2        |
            | primary       | yes      | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | secondary     | yes      | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | tertiary      | yes      | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | primary_link  | yes      | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | secondary_link| yes      | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | tertiary_link | yes      | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | residential   | yes      | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | cycleway      | yes      | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | footway       | yes      | 15 km/h | 15 km/h | 4.2       | 4.2        |

    Scenario: Bike - Apply no penalties to ways in direction of cycleways
        Then routability should be
            | highway       | cycleway:right | cycleway:left | forw       | backw      | forw_rate | backw_rate |
            | motorway      | yes            |               | 15 km/h    |            | 4.2       |            |
            | primary       | yes            |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | secondary     | yes            |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | tertiary      | yes            |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | primary_link  | yes            |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | secondary_link| yes            |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | tertiary_link | yes            |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | residential   | yes            |               | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | cycleway      | yes            |               | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | footway       | yes            |               | 6 km/h +-1 | 6 km/h +-1 | 4.2       | 1.7        |
            | motorway      |                | yes           | 15 km/h    |            |           | 4.2        |
            | primary       |                | yes           | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | secondary     |                | yes           | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | tertiary      |                | yes           | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | primary_link  |                | yes           | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | secondary_link|                | yes           | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | tertiary_link |                | yes           | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | residential   |                | yes           | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | cycleway      |                | yes           | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | footway       |                | yes           | 6 km/h +-1 | 6 km/h +-1 | 1.7       | 4.2        |


    Scenario: Bike - Don't apply penalties for all kind of cycleways
        Then routability should be
            | highway       | cycleway    | forw       | backw      | forw_rate | backw_rate |
            | tertiary      | shared_lane | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | tertiary      | lane        | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | tertiary      | opposite    | 15 km/h    | 15 km/h    | 2.9       | 4.2        |

